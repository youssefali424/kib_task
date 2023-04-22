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
