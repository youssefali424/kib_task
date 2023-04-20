import 'package:kib_task/core/language/index.dart';
import 'package:kib_task/core/network/response/base_api_result.dart';

mixin ErrorMessageMixin {
  String getMessage(ErrorType errorType,
      {Map<String, dynamic>? keyValueErrors, String? message}) {
    switch (errorType) {
      case ErrorType.noNework:
        return Translations.noInternet;
      case ErrorType.validationError:
        if (keyValueErrors != null && keyValueErrors.isNotEmpty) {
          return keyValueErrors.values.first.toString();
        }
        return Translations.unknownError;
      case ErrorType.generalError:
        return Translations.unknownError;
      default:
        return message ?? Translations.unknownError;
    }
  }
}
