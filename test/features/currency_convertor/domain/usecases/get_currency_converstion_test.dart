import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils.dart';

void main() {
  group("get currency conversion usecase", () {
    late ProviderContainer container;
    late CurrencyConvertorRepository repo;
    setUp(() {
      repo = MockCurrencyConvertorRepository();
      container = overrideCurrencyRepository(repo);
    });

    test('should return correct amount', () async {
      when(() => repo.currencyConverstionRate("EUR", "USD"))
          .thenAnswer((_) async {
        return SuccessApiResult(data: {
          usdCurrency.code: 1.11,
        });
      });
      var result = await container
          .read(getCurrencyConversionProvider)
          .call(from: "EUR", to: "USD", amount: 1);
      expect(
        result,
        isA<SuccessApiResult<Map<String, double>>>()
            .having((s) => s.message, 'message', null)
            .having((s) => s.data?.values.first, 'usd currency', 1.11)
            .having((s) => s.data?.keys.first, 'key', usdCurrency.code),
      );
      result = await container
          .read(getCurrencyConversionProvider)
          .call(from: "EUR", to: "USD", amount: 2);
      expect(
        result,
        isA<SuccessApiResult<Map<String, double>>>()
            .having((s) => s.message, 'message', null)
            .having((s) => s.data?.values.first, 'usd currency', 2 * 1.11)
            .having((s) => s.data?.keys.first, 'key', usdCurrency.code),
      );
    });
    test('should fail with no network', () async {
      when(() => repo.currencyConverstionRate(any(), any()))
          .thenAnswer((_) async {
        return FailureApiResult<Map<String, double>>(
            data: null, message: null, errorType: ErrorType.noNetwork);
      });
      final result = await container
          .read(getCurrencyConversionProvider)
          .call(from: "EUR", to: "USD", amount: 1);
      expect(
        result,
        isA<FailureApiResult<Map<String, double>>>()
            .having((s) => s.message, 'message', null)
            .having((s) => s.data, 'data', null)
            .having((s) => s.errorType, 'errorType', ErrorType.noNetwork),
      );
    });
  });
}
