import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kib_task/features/base/presentation/bloc/base_bloc_event.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';

import '../../../base/presentation/bloc/base_bloc_state.dart';
part 'currencies_bottom_sheet_state.freezed.dart';

// @freezed
// class SelectCurrencyEvent extends CurrencyEvent with _$ReplaceCurrencyEvent {
//   const factory ReplaceCurrencyEvent({
//     Currency? from,
//     Currency? to,
//   }) = $ReplaceCurrencyEvent;
// }

@freezed
class CurrenciesBottomSheetState
    with _$CurrenciesBottomSheetState
    implements BaseBlocState {
  const factory CurrenciesBottomSheetState({
    required List<Currency> currencies,
    Currency? selectedCurrency,
    @Default(false) bool isLoading,
    @Default(false) bool hasNoConnection,
    @Default("") String message,
  }) = CurrenciesBottomSheetLoadedState;
}
