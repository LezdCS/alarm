// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return _Alarm.fromJson(json);
}

/// @nodoc
mixin _$Alarm {
  int get id => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  set time(DateTime value) => throw _privateConstructorUsedError;
  String get audioPath => throw _privateConstructorUsedError;
  set audioPath(String value) => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  set enabled(bool value) => throw _privateConstructorUsedError;
  List<Days> get daysToRepeat => throw _privateConstructorUsedError;
  set daysToRepeat(List<Days> value) => throw _privateConstructorUsedError;
  List<dynamic> get events => throw _privateConstructorUsedError;
  set events(List<dynamic> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res, Alarm>;
  @useResult
  $Res call(
      {int id,
      DateTime time,
      String audioPath,
      bool enabled,
      List<Days> daysToRepeat,
      List<dynamic> events});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res, $Val extends Alarm>
    implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? audioPath = null,
    Object? enabled = null,
    Object? daysToRepeat = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      daysToRepeat: null == daysToRepeat
          ? _value.daysToRepeat
          : daysToRepeat // ignore: cast_nullable_to_non_nullable
              as List<Days>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$$_AlarmCopyWith(_$_Alarm value, $Res Function(_$_Alarm) then) =
      __$$_AlarmCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime time,
      String audioPath,
      bool enabled,
      List<Days> daysToRepeat,
      List<dynamic> events});
}

/// @nodoc
class __$$_AlarmCopyWithImpl<$Res> extends _$AlarmCopyWithImpl<$Res, _$_Alarm>
    implements _$$_AlarmCopyWith<$Res> {
  __$$_AlarmCopyWithImpl(_$_Alarm _value, $Res Function(_$_Alarm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? audioPath = null,
    Object? enabled = null,
    Object? daysToRepeat = null,
    Object? events = null,
  }) {
    return _then(_$_Alarm(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      daysToRepeat: null == daysToRepeat
          ? _value.daysToRepeat
          : daysToRepeat // ignore: cast_nullable_to_non_nullable
              as List<Days>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Alarm implements _Alarm {
  _$_Alarm(
      {required this.id,
      required this.time,
      required this.audioPath,
      required this.enabled,
      required this.daysToRepeat,
      required this.events});

  factory _$_Alarm.fromJson(Map<String, dynamic> json) =>
      _$$_AlarmFromJson(json);

  @override
  final int id;
  @override
  DateTime time;
  @override
  String audioPath;
  @override
  bool enabled;
  @override
  List<Days> daysToRepeat;
  @override
  List<dynamic> events;

  @override
  String toString() {
    return 'Alarm(id: $id, time: $time, audioPath: $audioPath, enabled: $enabled, daysToRepeat: $daysToRepeat, events: $events)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlarmCopyWith<_$_Alarm> get copyWith =>
      __$$_AlarmCopyWithImpl<_$_Alarm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlarmToJson(
      this,
    );
  }
}

abstract class _Alarm implements Alarm {
  factory _Alarm(
      {required final int id,
      required DateTime time,
      required String audioPath,
      required bool enabled,
      required List<Days> daysToRepeat,
      required List<dynamic> events}) = _$_Alarm;

  factory _Alarm.fromJson(Map<String, dynamic> json) = _$_Alarm.fromJson;

  @override
  int get id;
  @override
  DateTime get time;
  set time(DateTime value);
  @override
  String get audioPath;
  set audioPath(String value);
  @override
  bool get enabled;
  set enabled(bool value);
  @override
  List<Days> get daysToRepeat;
  set daysToRepeat(List<Days> value);
  @override
  List<dynamic> get events;
  set events(List<dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$_AlarmCopyWith<_$_Alarm> get copyWith =>
      throw _privateConstructorUsedError;
}
