abstract class ApiResult<T> {
  final T? data;
  final String? message;
  ApiResult({this.data, this.message});
}

class SuccessApiResult<T> extends ApiResult<T> {
  SuccessApiResult({
    super.data,
    super.message,
  });
}

class FailureApiResult<T> extends ApiResult<T> {
  final Map<String, dynamic>? keyValueErrors;
  final ErrorType errorType;

  FailureApiResult({
    super.data,
    super.message,
    this.keyValueErrors,
    required this.errorType,
  });
}

enum ErrorType {
  noNetwork,
  validationError,
  generalError,
  unAuthorized,
}
