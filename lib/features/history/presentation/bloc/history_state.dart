import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kib_task/features/base/presentation/bloc/base_bloc_event.dart';
import 'package:kib_task/features/base/presentation/bloc/base_bloc_state.dart';
import 'package:kib_task/features/history/data/models/history_data.dart';
part 'history_state.freezed.dart';

abstract class HistoryEvent extends BaseBlocEvent {
  const HistoryEvent();
}

@freezed
class LoadHistoricalDataEvent extends HistoryEvent
    with _$LoadHistoricalDataEvent {
  const factory LoadHistoricalDataEvent() = LoadHistoricalFetchDataEvent;
}

@freezed
class ShowChartEvent extends HistoryEvent with _$ShowChartEvent {
  const factory ShowChartEvent({required bool show}) = _ShowChartEvent;
}

@freezed
class HistoryState with _$HistoryState implements BaseBlocState {
  const factory HistoryState({
    required List<HistoryData> list,
    @Default(false) bool showChart,
    @Default(false) bool isLoading,
    @Default(false) bool hasNoConnection,
    @Default("") String message,
  }) = HistoryLoadedState;
}
