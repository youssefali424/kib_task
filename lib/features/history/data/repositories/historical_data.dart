import 'package:kib_task/features/history/data/data_source/history_remote.dart';
import 'package:kib_task/features/history/data/models/history_data.dart';

import '../../../../core/network/response/base_api_result.dart';
import '../../domain/repositories/historical_data.dart';

class HistoricalDataRepositoryImpl implements HistoricalDataRepository {
  HistoryRemoteDataSource remoteDataSource;
  HistoricalDataRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResult<List<HistoryData>>> getHistoricalData(
      {required String code,
      required String other,
      required String startDate,
      required String endDate}) {
    return remoteDataSource.getHistoricalData(
        code: code, other: other, startDate: startDate, endDate: endDate);
  }
}
