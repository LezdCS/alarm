import 'package:alarm/src/domain/entities/alarm.dart';
import 'package:alarm/src/domain/entities/weather.dart';
import 'package:alarm/src/domain/repositories/alarm_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

import '../../core/resources/data_state.dart';
import 'package:dio/dio.dart';

class AlarmRepositoryImpl extends AlarmRepository {
  @override
  Future<DataState<List<Alarm>>> getAlarms() async {
    final box = GetStorage();
    var alarmsString = box.read('alarms');
    if (alarmsString != null) {
      Map<String, dynamic> alarmsJson = jsonDecode(alarmsString);
      List<Alarm> alarms = [];
      return DataSuccess(alarms);
    }

    return const DataSuccess([]);
  }

  @override
  Future<DataState<Weather>> getWeather(
      double latitude, double longitude) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        "https://open-meteo.com/en/docs#latitude=$latitude&longitude=$longitude&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation_probability,precipitation,rain,snowfall,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,rain_sum,showers_sum,snowfall_sum&timezone=Asia%2FTokyo",
      );
      // debugPrint("Response: ${response.data}");
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      debugPrint("City: ${placemarks[0].locality}");
      Weather weather = Weather(
        temperature: 10,
        maxTemperature: 13,
        minTemperature: 7,
        humidity: 90,
        sunriseTime: DateTime.now(),
        location: placemarks[0],
        type: "Rainy",
      );
      return DataSuccess(weather);
    } catch (e) {
      debugPrint("Error: $e");
      return const DataFailed("Failed to fetch weater");
    }
  }
}
