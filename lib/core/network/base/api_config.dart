import 'package:dio/dio.dart';

abstract class ApiConfig {
  final Dio dio;
  List<Interceptor> get interceptors;

  ApiConfig({required this.dio}) {
    dio.interceptors.addAll(interceptors);
  }
}
