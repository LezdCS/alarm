import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';
part 'alarm.g.dart';

@unfreezed
class Alarm with _$Alarm {

  factory Alarm({
    required final int id,
    required DateTime time,
    required List<String> days,
    required bool enabled,
  }) = _Alarm;

  factory Alarm.fromJson(Map<String, Object?> json)
  => _$AlarmFromJson(json);
}
