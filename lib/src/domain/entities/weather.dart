import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {

  const factory Weather({
    required int temperature,
    required int maxTemperature,
    required int minTemperature,
    required int humidity,
    required String type,
    required DateTime sunriseTime,
    required String localization,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json)
  => _$WeatherFromJson(json);
}
