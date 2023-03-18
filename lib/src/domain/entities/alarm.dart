import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';
part 'alarm.g.dart';

@unfreezed
class Alarm with _$Alarm {

  factory Alarm({
    required final int id,
    required DateTime time,
    required String audioPath,
    required bool enabled,
    required List<Days> daysToRepeat,
    required List events,
  }) = _Alarm;

  factory Alarm.fromJson(Map<String, Object?> json)
  => _$AlarmFromJson(json);
}

enum Days { monday, tuesday, wednesday, thursday, friday, saturday, sunday}