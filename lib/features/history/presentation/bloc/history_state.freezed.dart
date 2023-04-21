// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadHistoricalDataEvent {}

/// @nodoc
abstract class $LoadHistoricalDataEventCopyWith<$Res> {
  factory $LoadHistoricalDataEventCopyWith(LoadHistoricalDataEvent value,
          $Res Function(LoadHistoricalDataEvent) then) =
      _$LoadHistoricalDataEventCopyWithImpl<$Res, LoadHistoricalDataEvent>;
}

/// @nodoc
class _$LoadHistoricalDataEventCopyWithImpl<$Res,
        $Val extends LoadHistoricalDataEvent>
    implements $LoadHistoricalDataEventCopyWith<$Res> {
  _$LoadHistoricalDataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadHistoricalFetchDataEventCopyWith<$Res> {
  factory _$$LoadHistoricalFetchDataEventCopyWith(
          _$LoadHistoricalFetchDataEvent value,
          $Res Function(_$LoadHistoricalFetchDataEvent) then) =
      __$$LoadHistoricalFetchDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHistoricalFetchDataEventCopyWithImpl<$Res>
    extends _$LoadHistoricalDataEventCopyWithImpl<$Res,
        _$LoadHistoricalFetchDataEvent>
    implements _$$LoadHistoricalFetchDataEventCopyWith<$Res> {
  __$$LoadHistoricalFetchDataEventCopyWithImpl(
      _$LoadHistoricalFetchDataEvent _value,
      $Res Function(_$LoadHistoricalFetchDataEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadHistoricalFetchDataEvent implements LoadHistoricalFetchDataEvent {
  const _$LoadHistoricalFetchDataEvent();

  @override
  String toString() {
    return 'LoadHistoricalDataEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadHistoricalFetchDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class LoadHistoricalFetchDataEvent implements LoadHistoricalDataEvent {
  const factory LoadHistoricalFetchDataEvent() = _$LoadHistoricalFetchDataEvent;
}

/// @nodoc
mixin _$ShowChartEvent {
  bool get show => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShowChartEventCopyWith<ShowChartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowChartEventCopyWith<$Res> {
  factory $ShowChartEventCopyWith(
          ShowChartEvent value, $Res Function(ShowChartEvent) then) =
      _$ShowChartEventCopyWithImpl<$Res, ShowChartEvent>;
  @useResult
  $Res call({bool show});
}

/// @nodoc
class _$ShowChartEventCopyWithImpl<$Res, $Val extends ShowChartEvent>
    implements $ShowChartEventCopyWith<$Res> {
  _$ShowChartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = null,
  }) {
    return _then(_value.copyWith(
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShowChartEventCopyWith<$Res>
    implements $ShowChartEventCopyWith<$Res> {
  factory _$$_ShowChartEventCopyWith(
          _$_ShowChartEvent value, $Res Function(_$_ShowChartEvent) then) =
      __$$_ShowChartEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool show});
}

/// @nodoc
class __$$_ShowChartEventCopyWithImpl<$Res>
    extends _$ShowChartEventCopyWithImpl<$Res, _$_ShowChartEvent>
    implements _$$_ShowChartEventCopyWith<$Res> {
  __$$_ShowChartEventCopyWithImpl(
      _$_ShowChartEvent _value, $Res Function(_$_ShowChartEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = null,
  }) {
    return _then(_$_ShowChartEvent(
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShowChartEvent implements _ShowChartEvent {
  const _$_ShowChartEvent({required this.show});

  @override
  final bool show;

  @override
  String toString() {
    return 'ShowChartEvent(show: $show)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShowChartEvent &&
            (identical(other.show, show) || other.show == show));
  }

  @override
  int get hashCode => Object.hash(runtimeType, show);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShowChartEventCopyWith<_$_ShowChartEvent> get copyWith =>
      __$$_ShowChartEventCopyWithImpl<_$_ShowChartEvent>(this, _$identity);
}

abstract class _ShowChartEvent implements ShowChartEvent {
  const factory _ShowChartEvent({required final bool show}) = _$_ShowChartEvent;

  @override
  bool get show;
  @override
  @JsonKey(ignore: true)
  _$$_ShowChartEventCopyWith<_$_ShowChartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryState {
  List<HistoryData> get list => throw _privateConstructorUsedError;
  bool get showChart => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasNoConnection => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call(
      {List<HistoryData> list,
      bool showChart,
      bool isLoading,
      bool hasNoConnection,
      String message});
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? showChart = null,
    Object? isLoading = null,
    Object? hasNoConnection = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      showChart: null == showChart
          ? _value.showChart
          : showChart // ignore: cast_nullable_to_non_nullable
              as bool,
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
}

/// @nodoc
abstract class _$$HistoryLoadedStateCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryLoadedStateCopyWith(_$HistoryLoadedState value,
          $Res Function(_$HistoryLoadedState) then) =
      __$$HistoryLoadedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HistoryData> list,
      bool showChart,
      bool isLoading,
      bool hasNoConnection,
      String message});
}

/// @nodoc
class __$$HistoryLoadedStateCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryLoadedState>
    implements _$$HistoryLoadedStateCopyWith<$Res> {
  __$$HistoryLoadedStateCopyWithImpl(
      _$HistoryLoadedState _value, $Res Function(_$HistoryLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? showChart = null,
    Object? isLoading = null,
    Object? hasNoConnection = null,
    Object? message = null,
  }) {
    return _then(_$HistoryLoadedState(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      showChart: null == showChart
          ? _value.showChart
          : showChart // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$HistoryLoadedState implements HistoryLoadedState {
  const _$HistoryLoadedState(
      {required final List<HistoryData> list,
      this.showChart = false,
      this.isLoading = false,
      this.hasNoConnection = false,
      this.message = ""})
      : _list = list;

  final List<HistoryData> _list;
  @override
  List<HistoryData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final bool showChart;
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
    return 'HistoryState(list: $list, showChart: $showChart, isLoading: $isLoading, hasNoConnection: $hasNoConnection, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryLoadedState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.showChart, showChart) ||
                other.showChart == showChart) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasNoConnection, hasNoConnection) ||
                other.hasNoConnection == hasNoConnection) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      showChart,
      isLoading,
      hasNoConnection,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryLoadedStateCopyWith<_$HistoryLoadedState> get copyWith =>
      __$$HistoryLoadedStateCopyWithImpl<_$HistoryLoadedState>(
          this, _$identity);
}

abstract class HistoryLoadedState implements HistoryState {
  const factory HistoryLoadedState(
      {required final List<HistoryData> list,
      final bool showChart,
      final bool isLoading,
      final bool hasNoConnection,
      final String message}) = _$HistoryLoadedState;

  @override
  List<HistoryData> get list;
  @override
  bool get showChart;
  @override
  bool get isLoading;
  @override
  bool get hasNoConnection;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$HistoryLoadedStateCopyWith<_$HistoryLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
