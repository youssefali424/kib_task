import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils.dart';

void main() {
  group("save currencies usecase", () {
    late ProviderContainer container;
    late CurrencyConvertorRepository repo;
    setUp(() {
      repo = MockCurrencyConvertorRepository();
      container = overrideCurrencyRepository(repo);
    });

    test('should save currencies data (saveCurrencies)', () async {
      int savedCount = 0;
      when(() => repo.saveCurrencies(any(that: const MapNotEmpty())))
          .thenAnswer((inv) async {
        expect(inv.positionalArguments[0], isA<Map<String, Currency>>());
        savedCount +=
            (inv.positionalArguments[0] as Map<String, Currency>).length;
      });
      await container.read(saveCurrenciesProvider).call({
        "USD": usdCurrency,
      });
      expect(
        savedCount,
        1,
      );
    });
  });
}
