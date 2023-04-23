import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/di/currency_conversion_di.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currency_converstion.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_local_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/save_currencies.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_converter_state.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_convertor_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:easy_localization/src/localization.dart';

import '../../../../utils.dart';

class FakeCurrencyConvertorState extends Fake
    implements CurrencyConvertorState {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeCurrencyConvertorState());
    Localization.load(
      const Locale('en'),
      translations: MockTranslations(),
    );
  });
  group("currency convertor bloc", () {
    late ProviderContainer container;
    late GetCurrencies getCurrencies;
    late GetCurrencyConversion getCurrencyConversion;
    late GetLocalCurrencies getLocalCurrencies;
    late SaveCurrencies saveCurrencies;
    late List<Override> overrides;
    setUp(() {
      /// mock bloc dependencies
      getCurrencies = MockGetCurrencies();
      getCurrencyConversion = MockGetCurrencyConversion();
      getLocalCurrencies = MockGetLocalCurrencies();
      saveCurrencies = MockSaveCurrencies();

      overrides = [
        getCurrenciesProvider.overrideWithValue(getCurrencies),
        getCurrencyConversionProvider.overrideWithValue(getCurrencyConversion),
        getLocalCurrenciesProvider.overrideWithValue(getLocalCurrencies),
        saveCurrenciesProvider.overrideWithValue(saveCurrencies),
      ];

      container = overrideContainer(
        overrides: [
          ...overrides,
          currencyConvertorBlocProvider.overrideWith((ref) =>
              CurrencyConvertorBloc(getCurrencyConversion, getCurrencies,
                  getLocalCurrencies, saveCurrencies)),
        ],
      );

    });

    group("load remote currencies", () {
      late int savedCount;

      setUp(() {
        when(() => getCurrencies.call()).thenAnswer((_) async {
          return SuccessApiResult(data: {
            usdCurrency.code: usdCurrency,
            eurCurrency.code: eurCurrency,
          });
        });

        when(() => getLocalCurrencies.call()).thenReturn({});

        savedCount = 0;
        when(() => saveCurrencies.call(any(that: const MapNotEmpty())))
            .thenAnswer((inv) async {
          expect(inv.positionalArguments[0], isA<Map<String, Currency>>());
          savedCount +=
              (inv.positionalArguments[0] as Map<String, Currency>).length;
        });

      });

      test('should load remote data successfully', () async {
        var bloc = container.read(currencyConvertorBlocProvider.bloc);
        allBlocStates(bloc, [
          const CurrencyConvertorState(isLoading: true),
          const CurrencyConvertorState(
            isLoading: false,
            from: usdCurrency,
            to: eurCurrency,
          ),
        ]);
        expect(bloc.state, const CurrencyConvertorState());
        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const LoadCurrenciesEvent());
      });
      test('should save remote data successfully', () async {
        var bloc = container.read(currencyConvertorBlocProvider.bloc);
        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const LoadCurrenciesEvent());
        await drainBlocEvents(bloc);
        expect(savedCount, 2);
      });
      test('should fail on no network', () async {
        when(() => getCurrencies.call()).thenAnswer((_) async {
          return FailureApiResult(
              data: null, message: null, errorType: ErrorType.noNetwork);
        });
        var bloc = container.read(currencyConvertorBlocProvider.bloc);
        allBlocStates(bloc, [
          const CurrencyConvertorState(isLoading: true),
          const CurrencyConvertorState(
            isLoading: false,
            hasNoConnection: true,
          ),
        ]);
        expect(bloc.state, const CurrencyConvertorState());
        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const LoadCurrenciesEvent());
        expect(savedCount, 0);
      });
    });
    group("load saved currencies", () {
      late int savedCount;
      setUp(() {
        when(() => getLocalCurrencies.call()).thenReturn({
          usdCurrency.code: usdCurrency,
          eurCurrency.code: eurCurrency,
        });
        savedCount = 0;
        when(() => saveCurrencies.call(any(that: const MapNotEmpty())))
            .thenAnswer((inv) async {
          expect(inv.positionalArguments[0], isA<Map<String, Currency>>());
          savedCount +=
              (inv.positionalArguments[0] as Map<String, Currency>).length;
        });
      });

      test('should load saved data successfully', () async {
        var bloc = container.read(currencyConvertorBlocProvider.bloc);
        allBlocStates(bloc, [
          const CurrencyConvertorState(
            isLoading: false,
            from: usdCurrency,
            to: eurCurrency,
          ),
        ]);
        expect(bloc.state, const CurrencyConvertorState());

        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const LoadCurrenciesEvent());
        expect(savedCount, 0);

      });
      test('should load saved data even with no network', () async {
        when(() => getCurrencies.call()).thenAnswer((_) async {
          return FailureApiResult(
              data: null, message: null, errorType: ErrorType.noNetwork);
        });

        var bloc = container.read(currencyConvertorBlocProvider.bloc);
        allBlocStates(bloc, [
          const CurrencyConvertorState(
            isLoading: false,
            from: usdCurrency,
            to: eurCurrency,
          ),
        ]);
        expect(bloc.state, const CurrencyConvertorState());

        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const LoadCurrenciesEvent());
        expect(savedCount, 0);
      });
    });

    group("convert currency amount", () {
      late CurrencyConvertorState initialState;
  
      setUp(() {
        when(() =>
                getCurrencyConversion.call(from: "EUR", to: "USD", amount: 1))
            .thenAnswer((inv) async {
          return SuccessApiResult(data: {"USD": 1.11});
        });

        initialState = const CurrencyConvertorState(
          from: eurCurrency,
          to: usdCurrency,
          amount: 1,
        );

        container = overrideContainer(
          overrides: [
            ...overrides,
            currencyConvertorBlocProvider.overrideWith((ref) =>
                CurrencyConvertorBloc(getCurrencyConversion, getCurrencies,
                    getLocalCurrencies, saveCurrencies,
                    initialState: initialState)),
          ],
        );

      });

      test("should convert amount successfully", () async {
        var bloc = container.read(currencyConvertorBlocProvider.bloc);

        allBlocStates(bloc, [
          const CurrencyConvertorState(
            isLoading: true,
            from: eurCurrency,
            to: usdCurrency,
            amount: 1,
          ),
          const CurrencyConvertorState(
            isLoading: false,
            from: eurCurrency,
            to: usdCurrency,
            amount: 1,
            converstionAmount: 1.11,
          )
        ]);

        expect(bloc.state, initialState);

        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const CurrencyConvertorEvent());
      });
      test("should fail on wrong amount", () async {
        var initialState = const CurrencyConvertorState(
          from: eurCurrency,
          to: usdCurrency,
          amount: 0,
        );

        container = overrideContainer(
          overrides: [
            ...overrides,
            currencyConvertorBlocProvider.overrideWith((ref) =>
                CurrencyConvertorBloc(getCurrencyConversion, getCurrencies,
                    getLocalCurrencies, saveCurrencies,
                    initialState: initialState)),
          ],
        );

        var bloc = container.read(currencyConvertorBlocProvider.bloc);

        allBlocStates(bloc, [
          initialState.copyWith(
            isLoading: true,
          ),
          isA<CurrencyConvertorState>()
              .having((c) => c.isLoading, "isLoading", false)
              .having((c) => c.message, "message", "amountError")
              .having((c) => c.converstionAmount, "converstionAmount", null),
        ]);
        expect(bloc.state, initialState);

        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const CurrencyConvertorEvent());
      });
      test("should fail on no network", () async {
        when(() =>
                getCurrencyConversion.call(from: "EUR", to: "USD", amount: 1.0))
            .thenAnswer((_) async {
          return FailureApiResult(
              data: null, message: null, errorType: ErrorType.noNetwork);
        });
        var bloc = container.read(currencyConvertorBlocProvider.bloc);

        allBlocStates(bloc, [
          initialState.copyWith(isLoading: true),
          isA<CurrencyConvertorState>()
              .having((c) => c.isLoading, "isLoading", false)
              .having((c) => c.message, "message", "noInternet")
              .having((c) => c.converstionAmount, "converstionAmount", null),
        ]);
        expect(bloc.state, initialState);

        container
            .read(currencyConvertorBlocProvider.bloc)
            .add(const CurrencyConvertorEvent());
      });
    });
  });
}
