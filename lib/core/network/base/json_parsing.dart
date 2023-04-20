import 'dart:convert';

import 'package:kib_task/features/currency_convertor/data/models/currency.dart';

extension JsonParsing on Map {
  T? parse<T>() {
    switch (T) {
      case Map<String, Currency>:
        return map<String, Currency>(
            (key, value) => MapEntry(key, Currency.fromJson(value))) as T;
      case Map<String, double>:
        return cast<String, double>() as T;
      default:
        return this is T ? this as T : null;
    }
  }
}
