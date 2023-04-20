import 'package:kib_task/features/currency_convertor/domain/repositories/currency_convertor.dart';

import '../../../../core/network/response/base_api_result.dart';

class GetCurrencyConversion {
  final CurrencyConvertorRepository repository;

  GetCurrencyConversion(this.repository);

  Future<ApiResult<Map<String, double>>> call(
      {required String from,
      required String to,
      required double amount}) async {
    var response = await repository.currencyConverstionRate(from, to);
    if (response is SuccessApiResult) {
      var data = response.data ?? {};
      data.forEach((key, value) {
        data[key] = value * amount;
      });
      return SuccessApiResult(data: data, message: response.message);
    }
    return response;
  }
}
