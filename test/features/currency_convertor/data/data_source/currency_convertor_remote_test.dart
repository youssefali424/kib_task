import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_urls.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
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
  test('should return right conversion rate', () async {
    when(
      () => mockFreeCurrencyApiMethods.get<Map<String, double>>(
          FreeCurrencyApiUrls.currencyConvertRate,
          params: {
            "base_currency": "EUR",
            "currencies": "USD",
          }),
    ).thenAnswer(
      (_) async => SuccessApiResult<Map<String, double>>(data: {
        "USD": 1.11,
      }),
    );
    final result = await container
        .read(currencyConvertorRemoteDataSourceProvider)
        .currencyConverstionRate("EUR", "USD");
    expect(
      result,
      isA<SuccessApiResult<Map<String, double>>>()
          .having((s) => s.message, 'message', null)
          .having((s) => s.data?.values.first, 'conversion', 1.11)
          .having((s) => s.data?.keys.first, 'key', "USD"),
    );
  });
  test('should fail to return conversion rate', () async {
    when(
      () => mockFreeCurrencyApiMethods.get<Map<String, double>>(
          FreeCurrencyApiUrls.currencyConvertRate,
          params: {
            "base_currency": "EUR",
            "currencies": "USD",
          }),
    ).thenAnswer(
      (_) async => FailureApiResult<Map<String, double>>(
          data: null, message: null, errorType: ErrorType.noNetwork),
    );
    final result = await container
        .read(currencyConvertorRemoteDataSourceProvider)
        .currencyConverstionRate("EUR", "USD");
    expect(
      result,
      isA<FailureApiResult<Map<String, double>>>()
          .having((s) => s.message, 'message', null)
          .having((s) => s.data, 'data', null)
          .having((s) => s.errorType, 'errorType', ErrorType.noNetwork),
    );
  });
}
