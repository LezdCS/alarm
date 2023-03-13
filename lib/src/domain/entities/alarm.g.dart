// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarm _$$_AlarmFromJson(Map<String, dynamic> json) => _$_Alarm(
      id: json['id'] as int,
      time: DateTime.parse(json['time'] as String),
      audioPath: json['audioPath'] as String,
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$_AlarmToJson(_$_Alarm instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time.toIso8601String(),
      'audioPath': instance.audioPath,
      'days': instance.days,
      'enabled': instance.enabled,
    };
