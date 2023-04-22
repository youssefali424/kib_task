import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils.dart';

void main() {
  group("get local currencies usecase", () {
    late ProviderContainer container;
    late CurrencyConvertorRepository repo;
    setUp(() {
      repo = MockCurrencyConvertorRepository();
      container = overrideCurrencyRepository(repo);
    });

    test('should return local currencies data', () async {
      when(() => repo.getLocalCurrencies()).thenAnswer((_) {
        return {
          "USD": usdCurrency,
        };
      });
      final result = container.read(getLocalCurrenciesProvider).call();
      expect(
        result,
        {
          "USD": usdCurrency,
        },
      );
    });
  });
}
