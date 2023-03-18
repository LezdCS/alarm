import 'package:alarm/src/domain/entities/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_view_controller.dart';

class AlarmCard extends GetView {
  final Alarm alarm;
  HomeViewController homeViewController = Get.find();

  AlarmCard({
    required this.alarm,
  });

  @override
  Widget build(BuildContext context) {
    List dateTimeSplit = alarm.time.toString().split(" ");
    String hour = dateTimeSplit[1].split(":")[0];
    String minutes = dateTimeSplit[1].split(":")[1].substring(0, 2);

    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 20.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$hour:$minutes",
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Switch(
                      value: alarm.enabled,
                      onChanged: (state) {
                        homeViewController.alarms
                            .firstWhere((element) => alarm.id == element.id)
                            .enabled = !alarm.enabled;
                        homeViewController.alarms.refresh();

                        if (state) {
                          homeViewController.setAlarm(alarm);
                        } else {
                          homeViewController.cancelAlarm(alarm);
                        }
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(alarm.days.join(", ")),
                    Text(alarm.daysToRepeat.isEmpty ? "Tomorrow" : "daystowrite"),
                    Text("${alarm.events.length} events"),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
