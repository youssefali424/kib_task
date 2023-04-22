import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_methods_impl.dart';
import 'package:kib_task/core/network/api_handlers/free_currency/api_urls.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio =
      Dio(BaseOptions(baseUrl: FreeCurrencyApiUrls.freecurrencyBaseUrl));
  late DioAdapter dioAdapter;
  group("[json] response parsed correctly", () {
    late FreeCurrencyApiMethodsImpl freeCurrencyApiMethods;
    setUp(() {
      dioAdapter = DioAdapter(dio: dio);
      freeCurrencyApiMethods = FreeCurrencyApiMethodsImpl(requesterDio: dio);
    });
    test('currencies api response parsed correctly', () async {
      dioAdapter.onGet(
        FreeCurrencyApiUrls.currencyList,
        (server) => server.reply(
          200,
          {
            "data": {
              "EUR": {
                "symbol": "€",
                "name": "Euro",
                "symbol_native": "€",
                "decimal_digits": 2,
                "rounding": 0,
                "code": "EUR",
                "name_plural": "Euros"
              },
              "USD": {
                "symbol": "\$",
                "name": "US Dollar",
                "symbol_native": "\$",
                "decimal_digits": 2,
                "rounding": 0,
                "code": "USD",
                "name_plural": "US dollars"
              },
              "JPY": {
                "symbol": "¥",
                "name": "Japanese Yen",
                "symbol_native": "￥",
                "decimal_digits": 0,
                "rounding": 0,
                "code": "JPY",
                "name_plural": "Japanese yen"
              },
            }
          },
        ),
      );
      final response = await freeCurrencyApiMethods
          .get<Map<String, Currency>>(FreeCurrencyApiUrls.currencyList);
      expect(
        response,
        isA<SuccessApiResult>(),
      );
      expect(
        response.data,
        isA<Map<String, Currency>>(),
      );
      expect(
        response.data!.entries.first,
        isA<MapEntry<String, Currency>>()
            .having((s) => s.key, 'key', 'EUR')
            .having((s) => s.value.symbol, 'symbol', '€')
            .having((s) => s.value.code, 'code', 'EUR'),
      );
      expect(
        response.data!.entries.last,
        isA<MapEntry<String, Currency>>()
            .having((s) => s.key, 'key', 'JPY')
            .having((s) => s.value.symbol, 'symbol', '¥')
            .having((s) => s.value.code, 'code', 'JPY'),
      );
    });
    test('latest api response parsed correctly', () async {
      dioAdapter.onGet(
        FreeCurrencyApiUrls.currencyConvertRate,
        (server) => server.reply(
          200,
          {
            "data": {"USD": 1.21225}
          },
        ),
        queryParameters: {
          'base_currency': "EUR",
          'currencies': "USD",
        },
      );

      final response = await freeCurrencyApiMethods.get<Map<String, double>>(
          FreeCurrencyApiUrls.currencyConvertRate,
          params: {
            'base_currency': "EUR",
            'currencies': "USD",
          });
      expect(
        response,
        isA<SuccessApiResult>(),
      );
      expect(
        response.data!.entries.first,
        isA<MapEntry<String, double>>()
            .having((s) => s.key, 'key', 'USD')
            .having((s) => s.value, 'conversion', 1.21225),
      );
    });
  });
  group("response returns no network", () {
    late FreeCurrencyApiMethodsImpl freeCurrencyApiMethods;
    setUp(() {
      dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
      dioAdapter.onGet(
        RegExp(".*"),
        (server) => server.throws(
            0,
            DioError(
              requestOptions: RequestOptions(),
              error: const SocketException("No Internet Connection"),
            )),
      );
      freeCurrencyApiMethods = FreeCurrencyApiMethodsImpl(requesterDio: dio);
    });
    test('latest api response no network', () async {
      final response = await freeCurrencyApiMethods.get<Map<String, double>>(
          FreeCurrencyApiUrls.currencyConvertRate,
          params: {
            'base_currency': "EUR",
            'currencies': "USD",
          });
      expect(
        response,
        isA<FailureApiResult>(),
      );
      expect((response as FailureApiResult).errorType, ErrorType.noNetwork);
    });
    test('currencies api response no network', () async {
      final response = await freeCurrencyApiMethods.get<Map<String, double>>(
        FreeCurrencyApiUrls.currencyList,
      );
      expect(
        response,
        isA<FailureApiResult>(),
      );
      expect((response as FailureApiResult).errorType, ErrorType.noNetwork);
    });
  });
}
