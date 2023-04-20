import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';

import '../../../../core/network/response/base_api_result.dart';

class GetCurrencies {
  final CurrencyConvertorRepository repository;

  GetCurrencies(this.repository);

  Future<ApiResult<Map<String, Currency>>> call() async {
    var response = await repository.getCurrencies();
    return response;
  }
}
