import '../base/json_parsing.dart';

class BaseResponse<T> {
  final T? data;
  final String? message;
  final Map<String, dynamic>? errors;

  BaseResponse({this.data, this.message, this.errors});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? errors;
    if (json['errors'] != null) {
      errors = json['errors'];
    } else if (json['error'] != null) {
      errors = json['error'];
    }
    return BaseResponse(
      data: (json["data"] as Map?)?.parse<T>(),
      message: json["message"],
      errors: errors,
    );
  }
}
