import 'package:alarm/src/presentation/widgets/alarm_card.dart';
import 'package:alarm/src/presentation/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../domain/entities/alarm.dart';
import '../controllers/home_view_controller.dart';

class HomeView extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => WeatherCard(
                  weather: controller.weather.value,
                  firstAlarm: controller.alarms.value
                      .firstWhereOrNull((element) => element.enabled),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Alarms",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.alarms.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          Alarm alarm = controller.alarms.value[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: AlarmCard(
                              alarm: alarm,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.ADD_ALARM);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ).bounce(begin: 0.2, end: 0)
            ],
          ),
        ),
      ),
    );
  }
}
