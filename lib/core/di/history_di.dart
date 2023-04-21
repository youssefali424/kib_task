import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/features/history/data/data_source/history_remote.dart';
import 'package:kib_task/features/history/domain/repositories/historical_data.dart';
import 'package:kib_task/features/history/domain/usecases/get_historical_data.dart';
import 'package:kib_task/features/history/presentation/bloc/history_state.dart';
import 'package:riverbloc/riverbloc.dart';

import '../../features/history/data/repositories/historical_data.dart';
import '../../features/history/presentation/bloc/history_bloc.dart';

final getHistoricalDataProvider = Provider<GetHistoricalData>((ref) {
  return GetHistoricalData(ref.watch(historicalDataRepositoryProvider));
});
final historicalDataRepositoryProvider =
    Provider<HistoricalDataRepository>((ref) {
  return HistoricalDataRepositoryImpl(
      remoteDataSource: ref.watch(historyRemoteDataSourceProvider));
});

final historyRemoteDataSourceProvider =
    Provider<HistoryRemoteDataSource>((ref) {
  return HistoryRemoteDataSourceImpl(
      apiMethods: ref.watch(freeCurrencyApiMethodsProvider));
});

final historyBlocProvider = BlocProvider<HistoryBloc, HistoryState>((ref) {
  throw UnimplementedError("historyBlocProvider is not overriden");
});
