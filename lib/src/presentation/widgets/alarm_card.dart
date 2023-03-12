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
                      "${alarm.time.hour}:${alarm.time.minute}",
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Switch(
                        value: alarm.enabled,
                        onChanged: (state) {
                          homeViewController.alarms
                              .firstWhere(
                                  (element) => alarm.id == element.id)
                              .enabled = !alarm.enabled;
                          homeViewController.alarms.refresh();
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
                    Text(alarm.days.join(", ")),
                    Text("2 events"),
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
