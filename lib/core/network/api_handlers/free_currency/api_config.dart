import 'package:dio/dio.dart';
import 'package:kib_task/core/network/base/api_config.dart';

class FreeCurrencyApiConfig extends ApiConfig {
  @override
  List<Interceptor> get interceptors => [FreeCurrencyInterceptor()];
  FreeCurrencyApiConfig({required super.dio});
}

class FreeCurrencyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apikey'] = _apikey;
    super.onRequest(options, handler);
  }

  /// for security reasons, apikeyshouldn't not be included in the code
  /// it should be stored on a remote server
  /// and called from there
  static String get _apikey => "HMxVh81XGsB53ELoevPSKUK20kcSZGU2rXkVu4jo";
}
