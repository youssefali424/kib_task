import 'package:kib_task/core/network/api_handlers/free_currency/api_methods.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';

import '../../../../core/network/api_handlers/free_currency/api_urls.dart';
import '../../../../core/network/response/base_api_result.dart';

abstract class CurrenciesRemoteDataSource {
  Future<ApiResult<Map<String, Currency>>> getCurrencies();
}

class CurrenciesRemoteDataSourceImpl extends CurrenciesRemoteDataSource {
  FreeCurrencyApiMethods apiMethods;
  CurrenciesRemoteDataSourceImpl({required this.apiMethods});
  @override
  Future<ApiResult<Map<String, Currency>>> getCurrencies() async {
    final response = await apiMethods.get<Map<String, Currency>>(
      FreeCurrencyApiUrls.currencyList,
    );
    return response;
  }
}
