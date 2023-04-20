import 'package:bloc/bloc.dart';
import 'package:kib_task/core/language/index.dart';

import 'package:kib_task/core/network/base/error_message_mixin.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currency_converstion.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_local_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/save_currencies.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_converter_state.dart';

import '../../domain/usecases/get_currencies.dart';

class CurrencyConvertorBloc extends Bloc<CurrencyEvent, CurrencyConvertorState>
    with ErrorMessageMixin {
  final GetCurrencyConversion _getCurrencyConversion;
  final GetCurrencies _getCurrencies;
  final GetLocalCurrencies _getLocalCurrencies;
  final SaveCurrencies _saveCurrencies;
  CurrencyConvertorBloc(
    this._getCurrencyConversion,
    this._getCurrencies,
    this._getLocalCurrencies,
    this._saveCurrencies,
  ) : super(const CurrencyConvertorState()) {
    on<CurrencyConvertorEvent>(
      (event, emit) async {
        if (state.from == null || state.to == null) {
          add(const LoadCurrenciesEvent());
          return;
        }
        emit(state.copyWith(isLoading: true, message: ""));

        if (state.amount == null || state.amount == 0) {
          emit(
            state.copyWith(
              message: Translations.amountError,
              isLoading: false,
            ),
          );
          return;
        }
        var result = await _getCurrencyConversion(
            from: state.from!.code,
            to: state.to!.code,
            amount: state.amount ?? 0);
        if (result is SuccessApiResult) {
          emit(state.copyWith(
              isLoading: false,
              converstionAmount: result.data?[state.to!.code] ?? 0,
              message: ""));
        } else if (result is FailureApiResult) {
          var message = getMessage((result as FailureApiResult).errorType,
              keyValueErrors: (result as FailureApiResult).keyValueErrors,
              message: result.message);
          emit(state.copyWith(message: message, isLoading: false));
        }
      },
    );
    on<LoadCurrenciesEvent>(
      (event, emit) async {
        final currencies = _getLocalCurrencies();
        if (currencies.length > 1) {
          emit(state.copyWith(
              from: currencies.values.first,
              to: currencies.values.elementAt(1),
              message: ""));
          return;
        }
        emit(state.copyWith(isLoading: true));
        var result = await _getCurrencies();
        if (result is SuccessApiResult) {
          var currencies = result.data ?? {};
          await _saveCurrencies(currencies);
          emit(state.copyWith(
              from: currencies.values.first,
              to: currencies.values.elementAt(1),
              isLoading: false,
              message: ""));
        } else if (result is FailureApiResult) {
          final errorType = (result as FailureApiResult).errorType;
          if (errorType == ErrorType.noNework) {
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
    on<OnAmountChangedEvent>((event, emit) {
      emit(state.copyWith(
        amount: double.tryParse(event.amount) ?? 0,
      ));
    });
    on<ReplaceCurrencyEvent>(replaceSelectedCurrency);
    on<SwitchCurrenciesEvent>(switchCurrenciesCurrency);
  }
  void replaceSelectedCurrency(
      ReplaceCurrencyEvent event, Emitter<CurrencyConvertorState> emit) {
    if ((event.to != null && event.to == state.from) ||
        (event.from != null && event.from == state.to)) {
      add(const SwitchCurrenciesEvent());
      return;
    }
    emit(state.copyWith(
      from: event.from ?? state.from,
      to: event.to ?? state.to,
      message: "",
    ));
    add(const CurrencyConvertorEvent());
  }

  void switchCurrenciesCurrency(
      SwitchCurrenciesEvent event, Emitter<CurrencyConvertorState> emit) {
    emit(state.copyWith(
      from: state.to,
      to: state.from,
      message: "",
    ));
    add(const CurrencyConvertorEvent());
  }
}
