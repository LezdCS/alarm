import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
  RxList<Weather> nextSevenDaysWeather = <Weather>[].obs;
  late Rx<Weather> weather;
  late Position? currentPosition;

  @override
  void onInit() async {
    super.onInit();

    alarms.addAll([
      Alarm(
        id: 1,
        time: DateTime.parse("2023-03-18 08:20:00"),
        enabled: false,
        audioPath: "assets/audios/1.mp3",
        daysToRepeat: [Days.monday, Days.thursday],
        events: [],
      ),
      Alarm(
        id: 2,
        time: DateTime.parse("2023-03-20 02:20:00"),
        enabled: false,
        audioPath: "assets/audios/1.mp3",
        daysToRepeat: [],
        events: [],
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
      type: WeatherType.clear,
    ).obs;
  }

  @override
  void onReady() async {
    super.onReady();

    getWeather()
        .then((List<Weather> value) => nextSevenDaysWeather.value = value);
    getCalendarsEvents().then((List<Event> value) => {
          for (Alarm alarm in alarms)
            {
              for (Event event in value)
                {
                  if (event.start!.difference(alarm.time).inDays == 0)
                    {
                      alarm.events.add(event),
                    }
                }
            }
        });

    Timer.periodic(const Duration(minutes: 5), (timer) {
      getWeather()
          .then((List<Weather> value) => nextSevenDaysWeather.value = value);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future setAlarm(Alarm alarm) async {
    DateTime alarmTime = alarm.time;

    if (alarm.time.isBefore(DateTime.now())) {
      DateTime now = DateTime.now();
      DateTime t = now.add(const Duration(days: 1));
      alarmTime =
          DateTime(t.year, t.month, t.day, alarm.time.hour, alarm.time.minute);
      alarms.firstWhere((element) => element.id == alarm.id).time = alarmTime;
    }

    alarms.firstWhere((element) => alarm.id == element.id).enabled = true;
    alarms.refresh();

    await AndroidAlarmManager.oneShotAt(
      alarm.time,
      alarm.id,
      callbackAlarm,
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

  @pragma('vm:entry-point')
  static void callbackAlarm(int id) {
    debugPrint("Alarm fired: $id");
    // alarms.firstWhereOrNull((element) => element.id == id)?.enabled = false;
  }

  Future cancelAlarm(Alarm alarm) async {
    await AndroidAlarmManager.cancel(alarm.id);
    alarms.firstWhere((element) => alarm.id == element.id).enabled = false;
    alarms.refresh();
    debugPrint("Alarm cancelled");
  }

  Future<List<Weather>> getWeather() async {
    currentPosition = await _determinePosition();
    homeEvents
        .getWeather(
      latitude: currentPosition!.latitude,
      longitude: currentPosition!.longitude,
      alarmTime:
          alarms.value.firstWhereOrNull((element) => element.enabled)?.time ??
              DateTime.now(),
    )
        .then(
      (value) => weather.value = value.data!,
      onError: (error) {
        debugPrint("Error: $error");
      },
    );

    return [];
  }

  Future<List<Event>> getCalendarsEvents() async {
    List<Event> events = [];

    DeviceCalendarPlugin deviceCalendarPlugin = DeviceCalendarPlugin();
    await deviceCalendarPlugin.requestPermissions();
    List<Calendar> c =
        await deviceCalendarPlugin.retrieveCalendars().then((value) {
      return value.data!;
    });

    for (Calendar element in c) {
      List<Event> e = await deviceCalendarPlugin
          .retrieveEvents(
        element.id,
        RetrieveEventsParams(
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 7)),
        ),
      )
          .then((value) {
        return value.data!;
      });
      events.addAll(e);
    }

    return events;
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
