import 'package:hive/hive.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';

abstract class CurrenciesLocalDataSource {
  Map<String, Currency> getCurrencies();
  Future<void> saveCurrencies(Map<String, Currency> currencies);
}

class CurrenciesLocalDataSourceImpl extends CurrenciesLocalDataSource {
  Box<Currency> hiveBox;
  CurrenciesLocalDataSourceImpl({required this.hiveBox});
  @override
  Map<String, Currency> getCurrencies() {
    return hiveBox.values
        .toList()
        .asMap()
        .map((key, value) => MapEntry(value.code, value));
  }

  @override
  Future<void> saveCurrencies(Map<String, Currency> currencies) async {
    if (hiveBox.isOpen) {
      await hiveBox.putAll(currencies);
    }
  }
}
