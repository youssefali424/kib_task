import 'package:bloc/bloc.dart';

import 'package:kib_task/core/network/base/error_message_mixin.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/history/data/models/history_data.dart';
import 'package:kib_task/features/history/domain/usecases/get_historical_data.dart';

import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState>
    with ErrorMessageMixin {
  final GetHistoricalData _getHistoricalData;

  HistoryBloc(
    this._getHistoricalData,
  ) : super(const HistoryState(list: [])) {
    on<LoadHistoricalDataEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, message: ""));
        var now = DateTime.now();
        final result = await _getHistoricalData(
          code: "USD",
          other: "EUR",
          endDate: now.subtract(const Duration(days: 1)).toIso8601String(),
          startDate: now.subtract(const Duration(days: 7)).toIso8601String(),
        );
        if (result is SuccessApiResult) {
          var list = result.data ?? [];
          emit(state.copyWith(isLoading: false, list: list, message: ""));
        } else if (result is FailureApiResult<List<HistoryData>>) {
          var message = getMessage((result).errorType,
              keyValueErrors: (result).keyValueErrors, message: result.message);
          emit(state.copyWith(message: message, isLoading: false));
        }
      },
    );
    on<ShowChartEvent>((event, emit) async {
      emit(state.copyWith(showChart: event.show, message: ""));
    });
  }
}
