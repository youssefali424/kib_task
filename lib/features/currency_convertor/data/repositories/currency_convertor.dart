import 'package:kib_task/features/currency_convertor/data/data_source/currencies_local.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currencies_remote.dart';
import 'package:kib_task/features/currency_convertor/data/data_source/currency_convertor_remote.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';

import '../../../../core/network/response/base_api_result.dart';
import '../../domain/repositories/currency_convertor.dart';

class CurrencyConvertorRepositoryImpl implements CurrencyConvertorRepository {
  CurrencyConvertorRemoteDataSource converstionDataSource;
  CurrenciesLocalDataSource localDataSource;
  CurrenciesRemoteDataSource remoteDataSource;
  CurrencyConvertorRepositoryImpl({
    required this.converstionDataSource,
    required this.localDataSource,
    required this.remoteDataSource,
  });
  @override
  Future<ApiResult<Map<String, double>>> currencyConverstionRate(
      String from, String to) {
    return converstionDataSource.currencyConverstionRate(from, to);
  }

  @override
  Future<ApiResult<Map<String, Currency>>> getCurrencies() {
    return remoteDataSource.getCurrencies();
  }

  @override
  Map<String, Currency> getLocalCurrencies() {
    return localDataSource.getCurrencies();
  }

  @override
  Future<void> saveCurrencies(Map<String, Currency> currencies) {
    return localDataSource.saveCurrencies(currencies);
  }
}
