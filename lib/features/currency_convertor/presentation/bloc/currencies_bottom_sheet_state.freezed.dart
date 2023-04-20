// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currencies_bottom_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrenciesBottomSheetState {
  List<Currency> get currencies => throw _privateConstructorUsedError;
  Currency? get selectedCurrency => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasNoConnection => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrenciesBottomSheetStateCopyWith<CurrenciesBottomSheetState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrenciesBottomSheetStateCopyWith<$Res> {
  factory $CurrenciesBottomSheetStateCopyWith(CurrenciesBottomSheetState value,
          $Res Function(CurrenciesBottomSheetState) then) =
      _$CurrenciesBottomSheetStateCopyWithImpl<$Res,
          CurrenciesBottomSheetState>;
  @useResult
  $Res call(
      {List<Currency> currencies,
      Currency? selectedCurrency,
      bool isLoading,
      bool hasNoConnection,
      String message});

  $CurrencyCopyWith<$Res>? get selectedCurrency;
}

/// @nodoc
class _$CurrenciesBottomSheetStateCopyWithImpl<$Res,
        $Val extends CurrenciesBottomSheetState>
    implements $CurrenciesBottomSheetStateCopyWith<$Res> {
  _$CurrenciesBottomSheetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? selectedCurrency = freezed,
    Object? isLoading = null,
    Object? hasNoConnection = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNoConnection: null == hasNoConnection
          ? _value.hasNoConnection
          : hasNoConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get selectedCurrency {
    if (_value.selectedCurrency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.selectedCurrency!, (value) {
      return _then(_value.copyWith(selectedCurrency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrenciesBottomSheetLoadedStateCopyWith<$Res>
    implements $CurrenciesBottomSheetStateCopyWith<$Res> {
  factory _$$CurrenciesBottomSheetLoadedStateCopyWith(
          _$CurrenciesBottomSheetLoadedState value,
          $Res Function(_$CurrenciesBottomSheetLoadedState) then) =
      __$$CurrenciesBottomSheetLoadedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Currency> currencies,
      Currency? selectedCurrency,
      bool isLoading,
      bool hasNoConnection,
      String message});

  @override
  $CurrencyCopyWith<$Res>? get selectedCurrency;
}

/// @nodoc
class __$$CurrenciesBottomSheetLoadedStateCopyWithImpl<$Res>
    extends _$CurrenciesBottomSheetStateCopyWithImpl<$Res,
        _$CurrenciesBottomSheetLoadedState>
    implements _$$CurrenciesBottomSheetLoadedStateCopyWith<$Res> {
  __$$CurrenciesBottomSheetLoadedStateCopyWithImpl(
      _$CurrenciesBottomSheetLoadedState _value,
      $Res Function(_$CurrenciesBottomSheetLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? selectedCurrency = freezed,
    Object? isLoading = null,
    Object? hasNoConnection = null,
    Object? message = null,
  }) {
    return _then(_$CurrenciesBottomSheetLoadedState(
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNoConnection: null == hasNoConnection
          ? _value.hasNoConnection
          : hasNoConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CurrenciesBottomSheetLoadedState
    implements CurrenciesBottomSheetLoadedState {
  const _$CurrenciesBottomSheetLoadedState(
      {required final List<Currency> currencies,
      this.selectedCurrency,
      this.isLoading = false,
      this.hasNoConnection = false,
      this.message = ""})
      : _currencies = currencies;

  final List<Currency> _currencies;
  @override
  List<Currency> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  @override
  final Currency? selectedCurrency;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasNoConnection;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'CurrenciesBottomSheetState(currencies: $currencies, selectedCurrency: $selectedCurrency, isLoading: $isLoading, hasNoConnection: $hasNoConnection, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrenciesBottomSheetLoadedState &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasNoConnection, hasNoConnection) ||
                other.hasNoConnection == hasNoConnection) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_currencies),
      selectedCurrency,
      isLoading,
      hasNoConnection,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrenciesBottomSheetLoadedStateCopyWith<
          _$CurrenciesBottomSheetLoadedState>
      get copyWith => __$$CurrenciesBottomSheetLoadedStateCopyWithImpl<
          _$CurrenciesBottomSheetLoadedState>(this, _$identity);
}

abstract class CurrenciesBottomSheetLoadedState
    implements CurrenciesBottomSheetState {
  const factory CurrenciesBottomSheetLoadedState(
      {required final List<Currency> currencies,
      final Currency? selectedCurrency,
      final bool isLoading,
      final bool hasNoConnection,
      final String message}) = _$CurrenciesBottomSheetLoadedState;

  @override
  List<Currency> get currencies;
  @override
  Currency? get selectedCurrency;
  @override
  bool get isLoading;
  @override
  bool get hasNoConnection;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CurrenciesBottomSheetLoadedStateCopyWith<
          _$CurrenciesBottomSheetLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}
