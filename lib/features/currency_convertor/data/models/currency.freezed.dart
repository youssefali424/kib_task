// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  @HiveField(0)
  String get code => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
  @HiveField(3)
  int get decimalDigits => throw _privateConstructorUsedError;
  @HiveField(4)
  int get rounding => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {@HiveField(0)
          String code,
      @HiveField(1)
          String name,
      @HiveField(2)
          String symbol,
      @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
      @HiveField(3)
          int decimalDigits,
      @HiveField(4)
          int rounding});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
    Object? decimalDigits = null,
    Object? rounding = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimalDigits: null == decimalDigits
          ? _value.decimalDigits
          : decimalDigits // ignore: cast_nullable_to_non_nullable
              as int,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$$_CurrencyCopyWith(
          _$_Currency value, $Res Function(_$_Currency) then) =
      __$$_CurrencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0)
          String code,
      @HiveField(1)
          String name,
      @HiveField(2)
          String symbol,
      @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
      @HiveField(3)
          int decimalDigits,
      @HiveField(4)
          int rounding});
}

/// @nodoc
class __$$_CurrencyCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$_Currency>
    implements _$$_CurrencyCopyWith<$Res> {
  __$$_CurrencyCopyWithImpl(
      _$_Currency _value, $Res Function(_$_Currency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
    Object? decimalDigits = null,
    Object? rounding = null,
  }) {
    return _then(_$_Currency(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimalDigits: null == decimalDigits
          ? _value.decimalDigits
          : decimalDigits // ignore: cast_nullable_to_non_nullable
              as int,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Currency implements _Currency {
  const _$_Currency(
      {@HiveField(0)
          required this.code,
      @HiveField(1)
          required this.name,
      @HiveField(2)
          required this.symbol,
      @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
      @HiveField(3)
          required this.decimalDigits,
      @HiveField(4)
          required this.rounding});

  factory _$_Currency.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyFromJson(json);

  @override
  @HiveField(0)
  final String code;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String symbol;
  @override
  @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
  @HiveField(3)
  final int decimalDigits;
  @override
  @HiveField(4)
  final int rounding;

  @override
  String toString() {
    return 'Currency(code: $code, name: $name, symbol: $symbol, decimalDigits: $decimalDigits, rounding: $rounding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Currency &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.decimalDigits, decimalDigits) ||
                other.decimalDigits == decimalDigits) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, symbol, decimalDigits, rounding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      __$$_CurrencyCopyWithImpl<_$_Currency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {@HiveField(0)
          required final String code,
      @HiveField(1)
          required final String name,
      @HiveField(2)
          required final String symbol,
      @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
      @HiveField(3)
          required final int decimalDigits,
      @HiveField(4)
          required final int rounding}) = _$_Currency;

  factory _Currency.fromJson(Map<String, dynamic> json) = _$_Currency.fromJson;

  @override
  @HiveField(0)
  String get code;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get symbol;
  @override
  @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
  @HiveField(3)
  int get decimalDigits;
  @override
  @HiveField(4)
  int get rounding;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      throw _privateConstructorUsedError;
}
