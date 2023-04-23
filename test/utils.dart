import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_methods.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currency_converstion.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_local_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/save_currencies.dart';
import 'package:mocktail/mocktail.dart';
import 'package:easy_localization/src/translations.dart';

class MapNotEmpty extends Matcher {
  const MapNotEmpty();

  @override
  bool matches(Object? item, Map matchState) => (item as Map).isNotEmpty;
  @override
  Description describe(Description description) => description.add('not empty');
}

class MockFreeCurrencyApiMethods extends Mock
    implements FreeCurrencyApiMethods {}

class MockCurrencyConvertorRepository extends Mock
    implements CurrencyConvertorRepository {}

ProviderContainer overrideCurrencyRepository(CurrencyConvertorRepository repo) {
  final container = ProviderContainer(
    overrides: [
      currencyConvertorRepositoryProvider.overrideWithValue(repo),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

const usdCurrency = Currency(
  code: "USD",
  name: "United States Dollar",
  symbol: "\$",
  decimalDigits: 2,
  rounding: 0,
);

const eurCurrency = Currency(
  code: "EUR",
  name: "Euro",
  symbol: "€",
  decimalDigits: 2,
  rounding: 0,
);

class MockGetLocalCurrencies extends Mock implements GetLocalCurrencies {}

class MockSaveCurrencies extends Mock implements SaveCurrencies {}

class MockGetCurrencyConversion extends Mock implements GetCurrencyConversion {}

class MockGetCurrencies extends Mock implements GetCurrencies {}

ProviderContainer overrideContainer({List<Override> overrides = const []}) {
  final container = ProviderContainer(
    overrides: overrides,
  );
  addTearDown(container.dispose);
  return container;
}

Future<void> nextBlocChange(
    BlocBase bloc, dynamic Function() changeListener) async {
  try {
    verify(
      changeListener,
    ).called(1);
    return;
  } on TestFailure catch (e) {
    if (!(e.message?.startsWith("No matching calls") ?? false)) rethrow;
  }
  late StreamSubscription sub;
  sub = bloc.stream.listen((event) {
    verify(
      changeListener,
    ).called(1);
    sub.cancel();
    return;
  });
}

/// matches all bloc states
/// then checks if there are no more states emitted
Future<void> allBlocStates<T>(BlocBase<T> bloc, List<T> states) async {
  await nextBlocChanges(bloc, states);
  await bloc.close();
  await noMoreInteractions(bloc);
}

Future<void> nextBlocChanges<T>(BlocBase<T> bloc, List<T> states) async {
  await expectLater(bloc.stream, emitsInOrder(states));
}

Future<void> noMoreInteractions<T>(BlocBase<T> bloc) async {
  await expectLater(bloc.stream, neverEmits(isA<T>()));
}

Future<void> drainBlocEvents(BlocBase bloc, {int? count}) async {
  if (count == null) {
    await bloc.close();
    return;
  }
  await bloc.stream.skip(count - 1).first;
}

class MockTranslations extends Mock implements Translations {
  @override
  String? get(String key) {
    return key;
  }
}
