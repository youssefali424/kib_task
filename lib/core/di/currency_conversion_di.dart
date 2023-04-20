import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_config.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_methods.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_methods_impl.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_urls.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currencies_local.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currencies_remote.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currency_convertor_remote.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/data/repositories/currency_convertor.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_currency_converstion.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/get_local_currencies.dart';
import 'package:kib_task/features/currency_convertor/domain/usecases/save_currencies.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currencies_bottom_sheet_bloc.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_converter_state.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_convertor_bloc.dart';
import 'package:riverbloc/riverbloc.dart';

import '../../features/currency_convertor/domain/repositories/currency_convertor.dart';
import '../../features/currency_convertor/presentation/bloc/currencies_bottom_sheet_state.dart';

final getCurrencyConversionProvider = Provider<GetCurrencyConversion>((ref) {
  return GetCurrencyConversion(ref.watch(currencyConvertorRepositoryProvider));
});
final currencyConvertorRepositoryProvider =
    Provider<CurrencyConvertorRepository>((ref) {
  return CurrencyConvertorRepositoryImpl(
    converstionDataSource: ref.watch(currencyConvertorRemoteDataSourceProvider),
    localDataSource: ref.watch(currenciesLocalDataSourceProvider),
    remoteDataSource: ref.watch(currenciesRemoteDataSourceProvider),
  );
});
final currencyConvertorRemoteDataSourceProvider =
    Provider<CurrencyConvertorRemoteDataSource>((ref) {
  return CurrencyConvertorRemoteDataSourceImpl(
      apiMethods: ref.watch(freeCurrencyApiMethodsProvider));
});
final freeCurrencyApiConfigProvider = Provider<FreeCurrencyApiConfig>((ref) {
  return FreeCurrencyApiConfig(
      dio: Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          baseUrl: FreeCurrencyApiUrls.freecurrencyBaseUrl)));
});
final currencyConvertorBlocProvider =
    BlocProvider<CurrencyConvertorBloc, CurrencyConvertorState>(
  (ref) => throw UnimplementedError(
      "currencyConvertorBlocProvider wasn't overriden"),
);
final hiveCurrenciesBoxProvider = Provider<Box<Currency>>((ref) {
  throw UnimplementedError();
});

final currenciesRemoteDataSourceProvider =
    Provider<CurrenciesRemoteDataSource>((ref) {
  return CurrenciesRemoteDataSourceImpl(
      apiMethods: ref.watch(freeCurrencyApiMethodsProvider));
});
final freeCurrencyApiMethodsProvider = Provider<FreeCurrencyApiMethods>((ref) {
  var config = ref.watch(freeCurrencyApiConfigProvider);
  return FreeCurrencyApiMethodsImpl(requesterDio: config.dio);
});
final currenciesLocalDataSourceProvider =
    Provider<CurrenciesLocalDataSource>((ref) {
  return CurrenciesLocalDataSourceImpl(
      hiveBox: ref.watch(hiveCurrenciesBoxProvider));
});
final getCurrenciesProvider = Provider<GetCurrencies>((ref) {
  return GetCurrencies(ref.watch(currencyConvertorRepositoryProvider));
});

final getLocalCurrenciesProvider = Provider<GetLocalCurrencies>((ref) {
  return GetLocalCurrencies(ref.watch(currencyConvertorRepositoryProvider));
});

final saveCurrenciesProvider = Provider<SaveCurrencies>((ref) {
  return SaveCurrencies(ref.watch(currencyConvertorRepositoryProvider));
});
final currenciesBottomSheetBlocProvider =
    BlocProvider<CurrenciesBottomSheetBloc, CurrenciesBottomSheetState>(
  (ref) => throw UnimplementedError("currenciesBlocProvider wasn't overriden"),
);
