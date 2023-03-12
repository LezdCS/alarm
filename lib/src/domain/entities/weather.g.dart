// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      temperature: json['temperature'] as int,
      maxTemperature: json['maxTemperature'] as int,
      minTemperature: json['minTemperature'] as int,
      humidity: json['humidity'] as int,
      type: json['type'] as String,
      sunriseTime: DateTime.parse(json['sunriseTime'] as String),
      localization: json['localization'] as String,
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'maxTemperature': instance.maxTemperature,
      'minTemperature': instance.minTemperature,
      'humidity': instance.humidity,
      'type': instance.type,
      'sunriseTime': instance.sunriseTime.toIso8601String(),
      'localization': instance.localization,
    };
