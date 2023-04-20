// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_converter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrencyConvertorEvent {}

/// @nodoc
abstract class $CurrencyConvertorEventCopyWith<$Res> {
  factory $CurrencyConvertorEventCopyWith(CurrencyConvertorEvent value,
          $Res Function(CurrencyConvertorEvent) then) =
      _$CurrencyConvertorEventCopyWithImpl<$Res, CurrencyConvertorEvent>;
}

/// @nodoc
class _$CurrencyConvertorEventCopyWithImpl<$Res,
        $Val extends CurrencyConvertorEvent>
    implements $CurrencyConvertorEventCopyWith<$Res> {
  _$CurrencyConvertorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CurrencyConvertorFetchDataEventCopyWith<$Res> {
  factory _$$CurrencyConvertorFetchDataEventCopyWith(
          _$CurrencyConvertorFetchDataEvent value,
          $Res Function(_$CurrencyConvertorFetchDataEvent) then) =
      __$$CurrencyConvertorFetchDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrencyConvertorFetchDataEventCopyWithImpl<$Res>
    extends _$CurrencyConvertorEventCopyWithImpl<$Res,
        _$CurrencyConvertorFetchDataEvent>
    implements _$$CurrencyConvertorFetchDataEventCopyWith<$Res> {
  __$$CurrencyConvertorFetchDataEventCopyWithImpl(
      _$CurrencyConvertorFetchDataEvent _value,
      $Res Function(_$CurrencyConvertorFetchDataEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrencyConvertorFetchDataEvent
    implements CurrencyConvertorFetchDataEvent {
  const _$CurrencyConvertorFetchDataEvent();

  @override
  String toString() {
    return 'CurrencyConvertorEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyConvertorFetchDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class CurrencyConvertorFetchDataEvent
    implements CurrencyConvertorEvent {
  const factory CurrencyConvertorFetchDataEvent() =
      _$CurrencyConvertorFetchDataEvent;
}

/// @nodoc
mixin _$OnAmountChangedEvent {
  String get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnAmountChangedEventCopyWith<OnAmountChangedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnAmountChangedEventCopyWith<$Res> {
  factory $OnAmountChangedEventCopyWith(OnAmountChangedEvent value,
          $Res Function(OnAmountChangedEvent) then) =
      _$OnAmountChangedEventCopyWithImpl<$Res, OnAmountChangedEvent>;
  @useResult
  $Res call({String amount});
}

/// @nodoc
class _$OnAmountChangedEventCopyWithImpl<$Res,
        $Val extends OnAmountChangedEvent>
    implements $OnAmountChangedEventCopyWith<$Res> {
  _$OnAmountChangedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$OnAmountChangedEventCopyWith<$Res>
    implements $OnAmountChangedEventCopyWith<$Res> {
  factory _$$$OnAmountChangedEventCopyWith(_$$OnAmountChangedEvent value,
          $Res Function(_$$OnAmountChangedEvent) then) =
      __$$$OnAmountChangedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String amount});
}

/// @nodoc
class __$$$OnAmountChangedEventCopyWithImpl<$Res>
    extends _$OnAmountChangedEventCopyWithImpl<$Res, _$$OnAmountChangedEvent>
    implements _$$$OnAmountChangedEventCopyWith<$Res> {
  __$$$OnAmountChangedEventCopyWithImpl(_$$OnAmountChangedEvent _value,
      $Res Function(_$$OnAmountChangedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$$OnAmountChangedEvent(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$$OnAmountChangedEvent implements $OnAmountChangedEvent {
  const _$$OnAmountChangedEvent({required this.amount});

  @override
  final String amount;

  @override
  String toString() {
    return 'OnAmountChangedEvent(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$OnAmountChangedEvent &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$OnAmountChangedEventCopyWith<_$$OnAmountChangedEvent> get copyWith =>
      __$$$OnAmountChangedEventCopyWithImpl<_$$OnAmountChangedEvent>(
          this, _$identity);
}

abstract class $OnAmountChangedEvent implements OnAmountChangedEvent {
  const factory $OnAmountChangedEvent({required final String amount}) =
      _$$OnAmountChangedEvent;

  @override
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$$OnAmountChangedEventCopyWith<_$$OnAmountChangedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoadCurrenciesEvent {}

/// @nodoc
abstract class $LoadCurrenciesEventCopyWith<$Res> {
  factory $LoadCurrenciesEventCopyWith(
          LoadCurrenciesEvent value, $Res Function(LoadCurrenciesEvent) then) =
      _$LoadCurrenciesEventCopyWithImpl<$Res, LoadCurrenciesEvent>;
}

/// @nodoc
class _$LoadCurrenciesEventCopyWithImpl<$Res, $Val extends LoadCurrenciesEvent>
    implements $LoadCurrenciesEventCopyWith<$Res> {
  _$LoadCurrenciesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CurrenciesFetchDataEventCopyWith<$Res> {
  factory _$$CurrenciesFetchDataEventCopyWith(_$CurrenciesFetchDataEvent value,
          $Res Function(_$CurrenciesFetchDataEvent) then) =
      __$$CurrenciesFetchDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrenciesFetchDataEventCopyWithImpl<$Res>
    extends _$LoadCurrenciesEventCopyWithImpl<$Res, _$CurrenciesFetchDataEvent>
    implements _$$CurrenciesFetchDataEventCopyWith<$Res> {
  __$$CurrenciesFetchDataEventCopyWithImpl(_$CurrenciesFetchDataEvent _value,
      $Res Function(_$CurrenciesFetchDataEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrenciesFetchDataEvent implements CurrenciesFetchDataEvent {
  const _$CurrenciesFetchDataEvent();

  @override
  String toString() {
    return 'LoadCurrenciesEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrenciesFetchDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class CurrenciesFetchDataEvent implements LoadCurrenciesEvent {
  const factory CurrenciesFetchDataEvent() = _$CurrenciesFetchDataEvent;
}

/// @nodoc
mixin _$SwitchCurrenciesEvent {}

/// @nodoc
abstract class $SwitchCurrenciesEventCopyWith<$Res> {
  factory $SwitchCurrenciesEventCopyWith(SwitchCurrenciesEvent value,
          $Res Function(SwitchCurrenciesEvent) then) =
      _$SwitchCurrenciesEventCopyWithImpl<$Res, SwitchCurrenciesEvent>;
}

/// @nodoc
class _$SwitchCurrenciesEventCopyWithImpl<$Res,
        $Val extends SwitchCurrenciesEvent>
    implements $SwitchCurrenciesEventCopyWith<$Res> {
  _$SwitchCurrenciesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$$SwitchCurrenciesEventCopyWith<$Res> {
  factory _$$$SwitchCurrenciesEventCopyWith(_$$SwitchCurrenciesEvent value,
          $Res Function(_$$SwitchCurrenciesEvent) then) =
      __$$$SwitchCurrenciesEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$$SwitchCurrenciesEventCopyWithImpl<$Res>
    extends _$SwitchCurrenciesEventCopyWithImpl<$Res, _$$SwitchCurrenciesEvent>
    implements _$$$SwitchCurrenciesEventCopyWith<$Res> {
  __$$$SwitchCurrenciesEventCopyWithImpl(_$$SwitchCurrenciesEvent _value,
      $Res Function(_$$SwitchCurrenciesEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$$SwitchCurrenciesEvent implements $SwitchCurrenciesEvent {
  const _$$SwitchCurrenciesEvent();

  @override
  String toString() {
    return 'SwitchCurrenciesEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$$SwitchCurrenciesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class $SwitchCurrenciesEvent implements SwitchCurrenciesEvent {
  const factory $SwitchCurrenciesEvent() = _$$SwitchCurrenciesEvent;
}

/// @nodoc
mixin _$ReplaceCurrencyEvent {
  Currency? get from => throw _privateConstructorUsedError;
  Currency? get to => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReplaceCurrencyEventCopyWith<ReplaceCurrencyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplaceCurrencyEventCopyWith<$Res> {
  factory $ReplaceCurrencyEventCopyWith(ReplaceCurrencyEvent value,
          $Res Function(ReplaceCurrencyEvent) then) =
      _$ReplaceCurrencyEventCopyWithImpl<$Res, ReplaceCurrencyEvent>;
  @useResult
  $Res call({Currency? from, Currency? to});

  $CurrencyCopyWith<$Res>? get from;
  $CurrencyCopyWith<$Res>? get to;
}

/// @nodoc
class _$ReplaceCurrencyEventCopyWithImpl<$Res,
        $Val extends ReplaceCurrencyEvent>
    implements $ReplaceCurrencyEventCopyWith<$Res> {
  _$ReplaceCurrencyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$ReplaceCurrencyEventCopyWith<$Res>
    implements $ReplaceCurrencyEventCopyWith<$Res> {
  factory _$$$ReplaceCurrencyEventCopyWith(_$$ReplaceCurrencyEvent value,
          $Res Function(_$$ReplaceCurrencyEvent) then) =
      __$$$ReplaceCurrencyEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Currency? from, Currency? to});

  @override
  $CurrencyCopyWith<$Res>? get from;
  @override
  $CurrencyCopyWith<$Res>? get to;
}

/// @nodoc
class __$$$ReplaceCurrencyEventCopyWithImpl<$Res>
    extends _$ReplaceCurrencyEventCopyWithImpl<$Res, _$$ReplaceCurrencyEvent>
    implements _$$$ReplaceCurrencyEventCopyWith<$Res> {
  __$$$ReplaceCurrencyEventCopyWithImpl(_$$ReplaceCurrencyEvent _value,
      $Res Function(_$$ReplaceCurrencyEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$$ReplaceCurrencyEvent(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency?,
    ));
  }
}

/// @nodoc

class _$$ReplaceCurrencyEvent implements $ReplaceCurrencyEvent {
  const _$$ReplaceCurrencyEvent({this.from, this.to});

  @override
  final Currency? from;
  @override
  final Currency? to;

  @override
  String toString() {
    return 'ReplaceCurrencyEvent(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ReplaceCurrencyEvent &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ReplaceCurrencyEventCopyWith<_$$ReplaceCurrencyEvent> get copyWith =>
      __$$$ReplaceCurrencyEventCopyWithImpl<_$$ReplaceCurrencyEvent>(
          this, _$identity);
}

abstract class $ReplaceCurrencyEvent implements ReplaceCurrencyEvent {
  const factory $ReplaceCurrencyEvent(
      {final Currency? from, final Currency? to}) = _$$ReplaceCurrencyEvent;

  @override
  Currency? get from;
  @override
  Currency? get to;
  @override
  @JsonKey(ignore: true)
  _$$$ReplaceCurrencyEventCopyWith<_$$ReplaceCurrencyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrencyConvertorState {
  double? get rate => throw _privateConstructorUsedError;
  Currency? get from => throw _privateConstructorUsedError;
  Currency? get to => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  double? get converstionAmount => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasNoConnection => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencyConvertorStateCopyWith<CurrencyConvertorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyConvertorStateCopyWith<$Res> {
  factory $CurrencyConvertorStateCopyWith(CurrencyConvertorState value,
          $Res Function(CurrencyConvertorState) then) =
      _$CurrencyConvertorStateCopyWithImpl<$Res, CurrencyConvertorState>;
  @useResult
  $Res call(
      {double? rate,
      Currency? from,
      Currency? to,
      double? amount,
      double? converstionAmount,
      bool isLoading,
      bool hasNoConnection,
      String message});

  $CurrencyCopyWith<$Res>? get from;
  $CurrencyCopyWith<$Res>? get to;
}

/// @nodoc
class _$CurrencyConvertorStateCopyWithImpl<$Res,
        $Val extends CurrencyConvertorState>
    implements $CurrencyConvertorStateCopyWith<$Res> {
  _$CurrencyConvertorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? amount = freezed,
    Object? converstionAmount = freezed,
    Object? isLoading = null,
    Object? hasNoConnection = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      converstionAmount: freezed == converstionAmount
          ? _value.converstionAmount
          : converstionAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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
  $CurrencyCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyConvertorLoadedStateCopyWith<$Res>
    implements $CurrencyConvertorStateCopyWith<$Res> {
  factory _$$CurrencyConvertorLoadedStateCopyWith(
          _$CurrencyConvertorLoadedState value,
          $Res Function(_$CurrencyConvertorLoadedState) then) =
      __$$CurrencyConvertorLoadedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? rate,
      Currency? from,
      Currency? to,
      double? amount,
      double? converstionAmount,
      bool isLoading,
      bool hasNoConnection,
      String message});

  @override
  $CurrencyCopyWith<$Res>? get from;
  @override
  $CurrencyCopyWith<$Res>? get to;
}

/// @nodoc
class __$$CurrencyConvertorLoadedStateCopyWithImpl<$Res>
    extends _$CurrencyConvertorStateCopyWithImpl<$Res,
        _$CurrencyConvertorLoadedState>
    implements _$$CurrencyConvertorLoadedStateCopyWith<$Res> {
  __$$CurrencyConvertorLoadedStateCopyWithImpl(
      _$CurrencyConvertorLoadedState _value,
      $Res Function(_$CurrencyConvertorLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? amount = freezed,
    Object? converstionAmount = freezed,
    Object? isLoading = null,
    Object? hasNoConnection = null,
    Object? message = null,
  }) {
    return _then(_$CurrencyConvertorLoadedState(
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      converstionAmount: freezed == converstionAmount
          ? _value.converstionAmount
          : converstionAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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

class _$CurrencyConvertorLoadedState implements CurrencyConvertorLoadedState {
  const _$CurrencyConvertorLoadedState(
      {this.rate,
      this.from,
      this.to,
      this.amount,
      this.converstionAmount,
      this.isLoading = false,
      this.hasNoConnection = false,
      this.message = ""});

  @override
  final double? rate;
  @override
  final Currency? from;
  @override
  final Currency? to;
  @override
  final double? amount;
  @override
  final double? converstionAmount;
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
    return 'CurrencyConvertorState(rate: $rate, from: $from, to: $to, amount: $amount, converstionAmount: $converstionAmount, isLoading: $isLoading, hasNoConnection: $hasNoConnection, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyConvertorLoadedState &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.converstionAmount, converstionAmount) ||
                other.converstionAmount == converstionAmount) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasNoConnection, hasNoConnection) ||
                other.hasNoConnection == hasNoConnection) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rate, from, to, amount,
      converstionAmount, isLoading, hasNoConnection, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyConvertorLoadedStateCopyWith<_$CurrencyConvertorLoadedState>
      get copyWith => __$$CurrencyConvertorLoadedStateCopyWithImpl<
          _$CurrencyConvertorLoadedState>(this, _$identity);
}

abstract class CurrencyConvertorLoadedState implements CurrencyConvertorState {
  const factory CurrencyConvertorLoadedState(
      {final double? rate,
      final Currency? from,
      final Currency? to,
      final double? amount,
      final double? converstionAmount,
      final bool isLoading,
      final bool hasNoConnection,
      final String message}) = _$CurrencyConvertorLoadedState;

  @override
  double? get rate;
  @override
  Currency? get from;
  @override
  Currency? get to;
  @override
  double? get amount;
  @override
  double? get converstionAmount;
  @override
  bool get isLoading;
  @override
  bool get hasNoConnection;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyConvertorLoadedStateCopyWith<_$CurrencyConvertorLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}
