import 'package:kib_task/features/history/data/models/history_data.dart';

import '../../../../core/network/response/base_api_result.dart';

abstract class HistoricalDataRepository {
  Future<ApiResult<List<HistoryData>>> getHistoricalData(
      {required String code,
      required String other,
      required String startDate,
      required String endDate});
}
