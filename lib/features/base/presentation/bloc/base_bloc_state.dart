import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BaseBlocState {
  bool get isLoading;
  bool get hasNoConnection;
  String get message;
}
