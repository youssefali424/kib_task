import 'package:kib_task/core/network/api_handlers/free_currency/api_methods.dart';
import 'package:kib_task/features/history/data/models/history_data.dart';

import '../../../../core/network/api_handlers/free_currency/api_urls.dart';
import '../../../../core/network/response/base_api_result.dart';

abstract class HistoryRemoteDataSource {
  Future<ApiResult<List<HistoryData>>> getHistoricalData(
      {required String code,
      required String other,
      required String startDate,
      required String endDate});
}

class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  FreeCurrencyApiMethods apiMethods;
  HistoryRemoteDataSourceImpl({required this.apiMethods});
  @override
  Future<ApiResult<List<HistoryData>>> getHistoricalData({
    required String code,
    required String other,
    required String startDate,
    required String endDate,
  }) async {
    final response = await apiMethods
        .get<List<HistoryData>>(FreeCurrencyApiUrls.history, params: {
      'date_from': startDate,
      'date_to': endDate,
      'currencies': other,
      'base_currency': code,
    });
    return response;
  }
}
