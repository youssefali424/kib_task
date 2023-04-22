import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';

import '../response/base_response.dart';

abstract class ApiMethods {
  final Dio requesterDio;

  ApiMethods({required this.requesterDio});

  Future<ApiResult<T>> get<T>(String url, {Map<String, String>? params}) async {
    try {
      Response response = await requesterDio.get(
        url,
        queryParameters: params,
        options: options,
      );

      return handleResponse<T>(response);
    } on DioError catch (error) {
      return catchError<T>(error);
    }
  }

  Future<ApiResult<T>> post<T>(String url, {Map<String, dynamic>? data}) async {
    try {
      Response response = await requesterDio.post(
        url,
        data: data,
        options: options,
      );

      return handleResponse<T>(response);
    } on DioError catch (error) {
      return catchError(error);
    }
  }

  Future<ApiResult<T>> postWithFormData<T>(String url,
      {required FormData data}) async {
    try {
      Response response = await requesterDio.post(
        url,
        data: data,
        options: options,
      );

      return handleResponse(response);
    } on DioError catch (error) {
      return catchError(error);
    }
  }

  ApiResult<T> handleResponse<T>(Response response) {
    var responseData = response.data;
    if (responseData == null) {
      return SuccessApiResult<T>();
    }
    BaseResponse<T> baseResponse = BaseResponse<T>.fromJson(responseData);
    return SuccessApiResult<T>(
        data: baseResponse.data, message: baseResponse.message);
  }

  ApiResult<E> catchError<E>(DioError dioError) {
    if (dioError.type == DioErrorType.badResponse) {
      return handleApiErrors(dioError);
    } else {
      return handleDioErrors(dioError);
    }
  }

  ApiResult<E> handleDioErrors<E>(DioError dioError) {
    if (dioError.error is SocketException) {
      return FailureApiResult<E>(errorType: ErrorType.noNetwork);
    }
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectionError:
        return FailureApiResult<E>(errorType: ErrorType.noNetwork);
      default:
        return FailureApiResult<E>(errorType: ErrorType.generalError);
    }
  }

  ApiResult<E> handleApiErrors<E>(DioError dioError) {
    var responseData = dioError.response?.data;
    if (responseData == null) {
      return FailureApiResult<E>(errorType: ErrorType.generalError);
    }
    BaseResponse<E> baseResponse = BaseResponse<E>.fromJson(responseData);

    switch (dioError.response?.statusCode) {
      case unauthorizedError:
        return FailureApiResult<E>(
            errorType: ErrorType.unAuthorized, message: baseResponse.message);
      case validationError:
        return FailureApiResult<E>(
            errorType: ErrorType.validationError,
            message: baseResponse.message,
            keyValueErrors: baseResponse.errors);

      case notFound:
        return FailureApiResult<E>(
            errorType: ErrorType.validationError,
            message: baseResponse.message,
            keyValueErrors: baseResponse.errors);
      default:
        return FailureApiResult<E>(errorType: ErrorType.generalError);
    }
  }

  Options get options => Options();
}

const int unauthorizedError = 401;
const int validationError = 422;
const int notFound = 404;
