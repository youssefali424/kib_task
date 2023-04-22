import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils.dart';

void main() {
  group("get remote currencies usecase", () {
    late ProviderContainer container;
    late CurrencyConvertorRepository repo;
    setUp(() {
      repo = MockCurrencyConvertorRepository();
      container = overrideCurrencyRepository(repo);
    });

    test('should return remote currencies data', () async {
      when(() => repo.getCurrencies()).thenAnswer((_) async {
        return SuccessApiResult(data: {
          usdCurrency.code: usdCurrency,
        });
      });
      final result = await container.read(getCurrenciesProvider).call();
      expect(
        result,
        isA<SuccessApiResult<Map<String, Currency>>>()
            .having((s) => s.message, 'message', null)
            .having((s) => s.data?.values.first, 'usd currency', usdCurrency)
            .having((s) => s.data?.keys.first, 'key', usdCurrency.code),
      );
    });
    test('should fail with no network', () async {
      when(() => repo.getCurrencies()).thenAnswer((_) async {
        return FailureApiResult<Map<String, Currency>>(
            data: null, message: null, errorType: ErrorType.noNetwork);
      });
      final result = await container.read(getCurrenciesProvider).call();
      expect(
        result,
        isA<FailureApiResult<Map<String, Currency>>>()
            .having((s) => s.message, 'message', null)
            .having((s) => s.data, 'data', null)
            .having((s) => s.errorType, 'errorType', ErrorType.noNetwork),
      );
    });
  });
}
