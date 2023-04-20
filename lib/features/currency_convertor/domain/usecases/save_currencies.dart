import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';


class SaveCurrencies {
  final CurrencyConvertorRepository repository;

  SaveCurrencies(this.repository);

  Future<void> call(Map<String, Currency> currencies) async {
    return repository.saveCurrencies(currencies);
  }
}
