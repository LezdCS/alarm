import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../domain/entities/alarm.dart';
import '../../domain/entities/weather.dart';
import '../events/home_events.dart';

class HomeViewController extends GetxController {
  HomeViewController({required this.homeEvents});

  final HomeEvents homeEvents;
  RxList<Alarm> alarms = <Alarm>[].obs;
  late Weather weather;

  @override
  void onInit() async {
    super.onInit();

    alarms.addAll([
      Alarm(
        id: 1,
        enabled: true,
        days: ["Mon", "Tue"],
        time: DateTime.parse("2023-03-14 11:47:00"),
      ),
      Alarm(
        id: 2,
        enabled: false,
        days: ["Fri"],
        time: DateTime.now(),
      ),
    ]);

    weather = Weather(
      temperature: 30,
      maxTemperature: 32,
      minTemperature: 19,
      humidity: 70,
      sunriseTime: DateTime.now(),
      localization: "Komagome",
      type: "Sunny",
    );

    //package location + free API for weather
    //https://pub.dev/packages/geolocator
    //https://open-meteo.com/en/docs#latitude=35.73&longitude=139.75&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation_probability,precipitation,rain,snowfall,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,rain_sum,showers_sum,snowfall_sum&timezone=Asia%2FTokyo
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
