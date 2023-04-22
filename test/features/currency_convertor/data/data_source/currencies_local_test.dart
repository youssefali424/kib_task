import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box<Currency> {}

void main() {
  late MockHiveBox mockHive;
  late ProviderContainer container;
  const currency = usdCurrency;
  setUp(() {
    mockHive = MockHiveBox();
    container = overrideContainer(
      overrides: [hiveCurrenciesBoxProvider.overrideWithValue(mockHive)],
    );
  });

  test('[success] currencies get local data ', () async {
    when(
      () => mockHive.values,
    ).thenReturn([currency]);

    final result =
        container.read(currenciesLocalDataSourceProvider).getCurrencies();
    expect(
      result,
      isA<Map<String, Currency>>()
          .having((s) => s.keys.first, 'key', "USD")
          .having((s) => s.values.first, 'usd currency', currency),
    );
  });
  test('[success] currencies save local data', () async {
    int savedCount = 0;
    when(
      () => mockHive.putAll(any(that: const MapNotEmpty())),
    ).thenAnswer((inv) async {
      expect(inv.positionalArguments[0], isA<Map<String, Currency>>());
      savedCount +=
          (inv.positionalArguments[0] as Map<String, Currency>).length;
    });
    when(
      () => mockHive.isOpen,
    ).thenReturn(true);
    container.read(currenciesLocalDataSourceProvider).saveCurrencies({
      "USD": currency,
      "EUR": currency.copyWith(code: "EUR", symbol: "€"),
    });
    container.read(currenciesLocalDataSourceProvider).saveCurrencies({
      "AUD": currency.copyWith(code: "AUD", symbol: "A\$"),
    });
    expect(savedCount, 3);
  });
}
