import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {

  const factory Weather({
    required int temperature,
    required int maxTemperature,
    required int minTemperature,
    required int humidity,
    required String type,
    required DateTime sunriseTime,
    required Placemark location,
  }) = _Weather;
}
