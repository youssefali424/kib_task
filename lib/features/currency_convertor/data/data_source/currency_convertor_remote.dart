import 'package:kib_task/core/network/api_handlers/free_currency/api_methods.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_urls.dart';

import '../../../../core/network/response/base_api_result.dart';

abstract class CurrencyConvertorRemoteDataSource {
  Future<ApiResult<Map<String, double>>> currencyConverstionRate(
      String from, String to);
}



class CurrencyConvertorRemoteDataSourceImpl
    extends CurrencyConvertorRemoteDataSource {
  FreeCurrencyApiMethods apiMethods;
  CurrencyConvertorRemoteDataSourceImpl({required this.apiMethods});
  @override
  Future<ApiResult<Map<String, double>>> currencyConverstionRate(
      String from, String to) async {
    final response = await apiMethods.get<Map<String, double>>(
        FreeCurrencyApiUrls.currencyConvertRate,
        params: {
          'base_currency': from,
          'currencies': to,
        });
    return response;
  }
}
