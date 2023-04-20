// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_mode_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangeThemeModeEvent {
  bool? get isDark => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangeThemeModeEventCopyWith<ChangeThemeModeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeThemeModeEventCopyWith<$Res> {
  factory $ChangeThemeModeEventCopyWith(ChangeThemeModeEvent value,
          $Res Function(ChangeThemeModeEvent) then) =
      _$ChangeThemeModeEventCopyWithImpl<$Res, ChangeThemeModeEvent>;
  @useResult
  $Res call({bool? isDark});
}

/// @nodoc
class _$ChangeThemeModeEventCopyWithImpl<$Res,
        $Val extends ChangeThemeModeEvent>
    implements $ChangeThemeModeEventCopyWith<$Res> {
  _$ChangeThemeModeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDark = freezed,
  }) {
    return _then(_value.copyWith(
      isDark: freezed == isDark
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeThemeModeEventEventCopyWith<$Res>
    implements $ChangeThemeModeEventCopyWith<$Res> {
  factory _$$_ChangeThemeModeEventEventCopyWith(
          _$_ChangeThemeModeEventEvent value,
          $Res Function(_$_ChangeThemeModeEventEvent) then) =
      __$$_ChangeThemeModeEventEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isDark});
}

/// @nodoc
class __$$_ChangeThemeModeEventEventCopyWithImpl<$Res>
    extends _$ChangeThemeModeEventCopyWithImpl<$Res,
        _$_ChangeThemeModeEventEvent>
    implements _$$_ChangeThemeModeEventEventCopyWith<$Res> {
  __$$_ChangeThemeModeEventEventCopyWithImpl(
      _$_ChangeThemeModeEventEvent _value,
      $Res Function(_$_ChangeThemeModeEventEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDark = freezed,
  }) {
    return _then(_$_ChangeThemeModeEventEvent(
      isDark: freezed == isDark
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ChangeThemeModeEventEvent implements _ChangeThemeModeEventEvent {
  const _$_ChangeThemeModeEventEvent({this.isDark});

  @override
  final bool? isDark;

  @override
  String toString() {
    return 'ChangeThemeModeEvent(isDark: $isDark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeThemeModeEventEvent &&
            (identical(other.isDark, isDark) || other.isDark == isDark));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeThemeModeEventEventCopyWith<_$_ChangeThemeModeEventEvent>
      get copyWith => __$$_ChangeThemeModeEventEventCopyWithImpl<
          _$_ChangeThemeModeEventEvent>(this, _$identity);
}

abstract class _ChangeThemeModeEventEvent implements ChangeThemeModeEvent {
  const factory _ChangeThemeModeEventEvent({final bool? isDark}) =
      _$_ChangeThemeModeEventEvent;

  @override
  bool? get isDark;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeThemeModeEventEventCopyWith<_$_ChangeThemeModeEventEvent>
      get copyWith => throw _privateConstructorUsedError;
}
