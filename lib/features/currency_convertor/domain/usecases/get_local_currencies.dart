import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';

class GetLocalCurrencies {
  final CurrencyConvertorRepository repository;

  GetLocalCurrencies(this.repository);

  Map<String, Currency> call() {
    return repository.getLocalCurrencies();
  }
}
