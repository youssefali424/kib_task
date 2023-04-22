import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currencies_local.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currencies_remote.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currency_convertor_remote.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils.dart';
import '../data_source/currencies_local_test.dart';

class MockCurrenciesLocalDataSource extends Mock
    implements CurrenciesLocalDataSource {}

class MockCurrenciesRemoteDataSource extends Mock
    implements CurrenciesRemoteDataSource {}

class MockCurrencyConvertorRemoteDataSource extends Mock
    implements CurrencyConvertorRemoteDataSource {}

void main() {
  group("CurrencyConvertorRepositoryImpl", () {
    late ProviderContainer container;

    late CurrenciesLocalDataSource localDataSource;
    late CurrenciesRemoteDataSource remoteDataSource;
    late CurrencyConvertorRemoteDataSource converstionDataSource;
    const usd = usdCurrency;
    setUp(() {
      localDataSource = MockCurrenciesLocalDataSource();
      remoteDataSource = MockCurrenciesRemoteDataSource();
      converstionDataSource = MockCurrencyConvertorRemoteDataSource();
      container = overrideContainer(
        overrides: [
          currenciesRemoteDataSourceProvider
              .overrideWithValue(remoteDataSource),
          currenciesLocalDataSourceProvider.overrideWithValue(localDataSource),
          currencyConvertorRemoteDataSourceProvider
              .overrideWithValue(converstionDataSource),
        ],
      );
    });
    group("[success] scenarios", () {
      test('should return remote currencies data (getCurrencies)',
          () async {
        when(() => remoteDataSource.getCurrencies()).thenAnswer((_) async {
          return SuccessApiResult<Map<String, Currency>>(data: {
            "USD": usd,
          });
        });
        final result = await container
            .read(currencyConvertorRepositoryProvider)
            .getCurrencies();
        expect(
          result,
          isA<SuccessApiResult<Map<String, Currency>>>()
              .having((s) => s.message, 'message', null)
              .having((s) => s.data?.values.first, 'usd currency', usd)
              .having((s) => s.data?.keys.first, 'key', "USD"),
        );
      });
      test('should return conversion rate (convert)', () async {
        when(() => converstionDataSource.currencyConverstionRate(
                any(that: isA<String>()), any(that: isA<String>())))
            .thenAnswer((_) async {
          return SuccessApiResult<Map<String, double>>(data: {"USD": 1.11});
        });
        final result = await container
            .read(currencyConvertorRepositoryProvider)
            .currencyConverstionRate("EUR", "USD");
        expect(
          result,
          isA<SuccessApiResult<Map<String, double>>>()
              .having((s) => s.message, 'message', null)
              .having((s) => s.data?.keys.first, 'key', "USD")
              .having((s) => s.data?.values.first, 'data', 1.11),
        );
      });

      test('should return local currencies data (getLocalCurrencies)',
          () async {
        when(() => localDataSource.getCurrencies()).thenAnswer((_) {
          return {
            "USD": usd,
          };
        });
        final result = container
            .read(currencyConvertorRepositoryProvider)
            .getLocalCurrencies();
        expect(
          result,
          {
            "USD": usd,
          },
        );
      });
      test('should save currencies data (saveCurrencies)', () async {
        int savedCount = 0;
        when(() =>
                localDataSource.saveCurrencies(any(that: const MapNotEmpty())))
            .thenAnswer((inv) async {
          expect(inv.positionalArguments[0], isA<Map<String, Currency>>());
          savedCount +=
              (inv.positionalArguments[0] as Map<String, Currency>).length;
        });
        await container
            .read(currencyConvertorRepositoryProvider)
            .saveCurrencies({
          "USD": usd,
        });
        expect(
          savedCount,
          1,
        );
      });
    });
  });
}
