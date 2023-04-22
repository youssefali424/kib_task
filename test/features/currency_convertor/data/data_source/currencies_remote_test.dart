import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils.dart';

void main() {
  late MockFreeCurrencyApiMethods mockFreeCurrencyApiMethods;
  late ProviderContainer container;
  setUp(() {
    mockFreeCurrencyApiMethods = MockFreeCurrencyApiMethods();
    container = overrideContainer(
      overrides: [
        freeCurrencyApiMethodsProvider
            .overrideWithValue(mockFreeCurrencyApiMethods)
      ],
    );
  });
  test('should get remote currencies data', () async {
    const currency = usdCurrency;
    when(
      () => mockFreeCurrencyApiMethods.get<Map<String, Currency>>(any()),
    ).thenAnswer(
      (_) async => SuccessApiResult<Map<String, Currency>>(data: {
        "USD": currency,
      }),
    );

    final result = await container
        .read(currenciesRemoteDataSourceProvider)
        .getCurrencies();
    expect(
      result,
      isA<SuccessApiResult<Map<String, Currency>>>()
          .having((s) => s.message, 'message', null)
          .having((s) => s.data?.values.first, 'usd currency', currency)
          .having((s) => s.data?.keys.first, 'key', "USD"),
    );
  });
  test('should fail to get remote currencies', () async {
    when(
      () => mockFreeCurrencyApiMethods.get<Map<String, Currency>>(any()),
    ).thenAnswer(
      (_) async => FailureApiResult<Map<String, Currency>>(
          data: null, message: null, errorType: ErrorType.noNetwork),
    );
    final result = await container
        .read(currenciesRemoteDataSourceProvider)
        .getCurrencies();
    expect(
      result,
      isA<FailureApiResult<Map<String, Currency>>>()
          .having((s) => s.message, 'message', null)
          .having((s) => s.data, 'data', null)
          .having((s) => s.errorType, 'errorType', ErrorType.noNetwork),
    );
  });
}
