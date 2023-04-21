import 'package:kib_task/features/history/data/models/history_data.dart';
import 'package:kib_task/features/history/domain/repositories/historical_data.dart';

import '../../../../core/network/response/base_api_result.dart';

class GetHistoricalData {
  final HistoricalDataRepository repository;

  GetHistoricalData(this.repository);

  Future<ApiResult<List<HistoryData>>> call(
      {required String code,
      required String other,
      required String startDate,
      required String endDate}) async {
    var response = await repository.getHistoricalData(
        code: code, other: other, startDate: startDate, endDate: endDate);
    return response;
  }
}
