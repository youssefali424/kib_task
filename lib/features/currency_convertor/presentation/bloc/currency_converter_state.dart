import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kib_task/features/base/presentation/bloc/base_bloc_event.dart';
import 'package:kib_task/features/base/presentation/bloc/base_bloc_state.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
part 'currency_converter_state.freezed.dart';

abstract class CurrencyEvent extends BaseBlocEvent {
  const CurrencyEvent();
}

@freezed
class CurrencyConvertorEvent extends CurrencyEvent
    with _$CurrencyConvertorEvent {
  const factory CurrencyConvertorEvent() = CurrencyConvertorFetchDataEvent;
}

@freezed
class OnAmountChangedEvent extends CurrencyEvent with _$OnAmountChangedEvent {
  const factory OnAmountChangedEvent({
    required String amount,
  }) = $OnAmountChangedEvent;
}

@freezed
class LoadCurrenciesEvent extends CurrencyEvent with _$LoadCurrenciesEvent {
  const factory LoadCurrenciesEvent() = CurrenciesFetchDataEvent;
}

@freezed
class SwitchCurrenciesEvent extends CurrencyEvent with _$SwitchCurrenciesEvent {
  const factory SwitchCurrenciesEvent() = $SwitchCurrenciesEvent;
}

@freezed
class ReplaceCurrencyEvent extends CurrencyEvent with _$ReplaceCurrencyEvent {
  const factory ReplaceCurrencyEvent({
    Currency? from,
    Currency? to,
  }) = $ReplaceCurrencyEvent;
}

@freezed
class CurrencyConvertorState
    with _$CurrencyConvertorState
    implements BaseBlocState {
  const factory CurrencyConvertorState({
    double? rate,
    Currency? from,
    Currency? to,
    double? amount,
    double? converstionAmount,
    @Default(false) bool isLoading,
    @Default(false) bool hasNoConnection,
    @Default("") String message,
  }) = CurrencyConvertorLoadedState;
}
