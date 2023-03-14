import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const Weather._(); // Added constructor
  const factory Weather({
    required int temperature,
    required int maxTemperature,
    required int minTemperature,
    required int humidity,
    required WeatherType type,
    required DateTime sunriseTime,
    required Placemark location,
  }) = _Weather;

  String getWeatherString() {
    switch (type) {
      case WeatherType.clear:
        return "Clear";
      case WeatherType.mainlyClear:
        return "Mainly clear";
      case WeatherType.partlyCloudy:
        return "Partly cloudy";
      case WeatherType.overcast:
        return "Overcast";
      case WeatherType.fog:
        return "Fog";
      case WeatherType.depositingRimeFog:
        return "Deposit rime fog";
      case WeatherType.lightDrizzle:
        return "Light drizzle";
      case WeatherType.moderateDrizzle:
        return "Moderate drizzle";
      case WeatherType.denseDrizzle:
        return "Dense drizzle";
      case WeatherType.freezingLightDrizzle:
        return "Freezing light drizzle";
      case WeatherType.freezingModerateDrizzle:
        return "Freezing moderate drizzle";
      case WeatherType.freezingDenseDrizzle:
        return "Freezing dense drizzle";
      case WeatherType.slightRain:
        return "Slight rain";
      case WeatherType.moderateRain:
        return "Moderate rain";
      case WeatherType.heavyRain:
        return "Heavy rain";
      case WeatherType.freezingLightRain:
        return "Freezing light rain";
      case WeatherType.freezingHeavyRain:
        return "Freezing heavy rain";
      case WeatherType.slightSnowFall:
        return "Slight snow fall";
      case WeatherType.moderateSnowFall:
        return "Moderate snow fall";
      case WeatherType.heavySnowFall:
        return "Heavy snow fall";
      case WeatherType.snowGrains:
        return "Snow grains";
      case WeatherType.slightRainShowers:
        return "Slight rain showers";
      case WeatherType.moderateRainShowers:
        return "Moderate rain showers";
      case WeatherType.violentRainShowers:
        return "Violent rain showers";
      case WeatherType.slightSnowShowers:
        return "Slight snow showers";
      case WeatherType.heavySnowShowers:
        return "Heavy snow showers";
      case WeatherType.slightThunderstorm:
        return "Slight thunderstorm";
      case WeatherType.moderateThunderstorm:
        return "Moderate thunderstorm";
      case WeatherType.thunderstormWithSlightHail:
        return "Thunderstorm with slight hail";
      case WeatherType.thunderstormWithHeavyHail:
        return "Thunderstorm with heavy hail";
      default:
        return "Unknown";
    }
  }
}

enum WeatherType {
  clear,
  mainlyClear,
  partlyCloudy,
  overcast,
  fog,
  depositingRimeFog,
  lightDrizzle,
  moderateDrizzle,
  denseDrizzle,
  freezingLightDrizzle,
  freezingModerateDrizzle,
  freezingDenseDrizzle,
  slightRain,
  moderateRain,
  heavyRain,
  freezingLightRain,
  freezingHeavyRain,
  slightSnowFall,
  moderateSnowFall,
  heavySnowFall,
  snowGrains,
  slightRainShowers,
  moderateRainShowers,
  violentRainShowers,
  slightSnowShowers,
  heavySnowShowers,
  slightThunderstorm,
  moderateThunderstorm,
  thunderstormWithSlightHail,
  thunderstormWithHeavyHail,
}
