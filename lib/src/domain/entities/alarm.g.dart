// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarm _$$_AlarmFromJson(Map<String, dynamic> json) => _$_Alarm(
      id: json['id'] as int,
      time: DateTime.parse(json['time'] as String),
      audioPath: json['audioPath'] as String,
      enabled: json['enabled'] as bool,
      daysToRepeat: (json['daysToRepeat'] as List<dynamic>)
          .map((e) => $enumDecode(_$DaysEnumMap, e))
          .toList(),
      events: json['events'] as List<dynamic>,
    );

Map<String, dynamic> _$$_AlarmToJson(_$_Alarm instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time.toIso8601String(),
      'audioPath': instance.audioPath,
      'enabled': instance.enabled,
      'daysToRepeat':
          instance.daysToRepeat.map((e) => _$DaysEnumMap[e]!).toList(),
      'events': instance.events,
    };

const _$DaysEnumMap = {
  Days.monday: 'monday',
  Days.tuesday: 'tuesday',
  Days.wednesday: 'wednesday',
  Days.thursday: 'thursday',
  Days.friday: 'friday',
  Days.saturday: 'saturday',
  Days.sunday: 'sunday',
};
