import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../domain/entities/alarm.dart';
import '../../domain/entities/weather.dart';
import '../events/home_events.dart';
import 'package:geolocator/geolocator.dart';

class HomeViewController extends GetxController {
  HomeViewController({required this.homeEvents});

  final HomeEvents homeEvents;
  RxList<Alarm> alarms = <Alarm>[].obs;
  late Rx<Weather> weather;
  late Position? currentPosition;

  @override
  void onInit() async {
    super.onInit();

    alarms.addAll([
      Alarm(
        id: 1,
        time: DateTime.parse("2023-03-14 01:49:00"),
        enabled: false,
        audioPath: "assets/audios/1.mp3",
        days: ["Mon", "Tue"],
      ),
      Alarm(
        id: 2,
        time: DateTime.now(),
        enabled: false,
        audioPath: "assets/audios/1.mp3",
        days: ["Fri"],
      ),
    ]);

    weather = Weather(
      temperature: 30,
      maxTemperature: 32,
      minTemperature: 19,
      humidity: 70,
      sunriseTime: DateTime.now(),
      location: Placemark(
        administrativeArea: "Tokyo",
        country: "Japan",
        locality: "Tokyo",
        name: "Tokyo",
        postalCode: "100-0001",
        subAdministrativeArea: "Tokyo",
        subLocality: "Tokyo",
        subThoroughfare: "Tokyo",
        thoroughfare: "Tokyo",
      ),
      type: "Sunny",
    ).obs;

    currentPosition = await _determinePosition();
    debugPrint("Current position: $currentPosition");
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude);
    debugPrint("City: ${placemarks[0].locality}");
    // weather.location = placemarks[0];
    //free API for weather
    //https://open-meteo.com/en/docs#latitude=35.73&longitude=139.75&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation_probability,precipitation,rain,snowfall,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,rain_sum,showers_sum,snowfall_sum&timezone=Asia%2FTokyo
  }

  @override
  void onReady() {
    super.onReady();

    Timer.periodic(const Duration(minutes: 1), (timer) {
      // homeEvents.updateWeather();
      weather.refresh();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future setAlarm(Alarm alarm) async {
    await AndroidAlarmManager.oneShotAt(
      alarm.time,
      alarm.id,
      (int id) async {
        debugPrint("Alarm fired: $id");
      },
      wakeup: true,
      exact: true,
      allowWhileIdle: true,
      rescheduleOnReboot: true,
      params: {
        // 'assetAudioPath': alarm.audioPath,
        'loopAudio': false,
        'fadeDuration': 5,
      },
    );
    debugPrint("Alarm set");
  }

  Future cancelAlarm(Alarm alarm) async {
    await AndroidAlarmManager.cancel(alarm.id);
    debugPrint("Alarm cancelled");
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
