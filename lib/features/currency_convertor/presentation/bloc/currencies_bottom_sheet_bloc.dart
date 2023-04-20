import 'package:bloc/bloc.dart';
import 'package:kib_task/core/language/index.dart';

import 'package:kib_task/core/network/base/error_message_mixin.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currency_converstion.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_local_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/save_currencies.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_converter_state.dart';

import '../../domain/usecases/get_currencies.dart';
import 'currencies_bottom_sheet_state.dart';

class CurrenciesBottomSheetBloc
    extends Bloc<CurrencyEvent, CurrenciesBottomSheetState>
    with ErrorMessageMixin {
  final GetCurrencies _getCurrencies;
  final GetLocalCurrencies _getLocalCurrencies;
  final SaveCurrencies _saveCurrencies;
  CurrenciesBottomSheetBloc(
    this._getCurrencies,
    this._getLocalCurrencies,
    this._saveCurrencies, {
    Currency? selected,
  }) : super(CurrenciesBottomSheetState(
            selectedCurrency: selected, currencies: [])) {
    on<LoadCurrenciesEvent>(
      (event, emit) async {
        final currencies = _getLocalCurrencies();
        if (currencies.length > 1) {
          emit(state.copyWith(
              currencies: currencies.values.toList(), message: ""));
          return;
        }
        emit(state.copyWith(isLoading: true));
        var result = await _getCurrencies();
        if (result is SuccessApiResult) {
          var currencies = result.data ?? {};
          await _saveCurrencies(currencies);
          emit(state.copyWith(
              currencies: currencies.values.toList(),
              isLoading: false,
              message: ""));
        } else if (result is FailureApiResult) {
          final errorType = (result as FailureApiResult).errorType;
          if (errorType == ErrorType.noNetwork) {
            emit(state.copyWith(
                isLoading: false, message: "", hasNoConnection: true));
            return;
          }
          var message = getMessage(errorType,
              keyValueErrors: (result as FailureApiResult).keyValueErrors,
              message: result.message);
          emit(state.copyWith(
            isLoading: false,
            message: message,
          ));
        }
      },
    );
  }
}
