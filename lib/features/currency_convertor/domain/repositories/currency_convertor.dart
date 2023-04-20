import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currencies.dart';

import '../../../../core/network/response/base_api_result.dart';

abstract class CurrencyConvertorRepository {
  Future<ApiResult<Map<String, double>>> currencyConverstionRate(
      String from, String to);
  Future<ApiResult<Map<String, Currency>>> getCurrencies();
  Map<String, Currency> getLocalCurrencies();
  Future<void> saveCurrencies(Map<String, Currency> currencies);
}
