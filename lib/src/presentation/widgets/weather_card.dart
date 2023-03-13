import 'package:flutter/material.dart';

import '../../domain/entities/alarm.dart';
import '../../domain/entities/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  final Alarm? firstAlarm;

  WeatherCard({
    required this.weather,
    required this.firstAlarm,
  });

  hours(Duration d) =>  d.toString().split(':')[0];
  minutes(Duration d) => d.toString().split(':')[1];

  @override
  Widget build(BuildContext context) {
    Duration? d = firstAlarm?.time.difference(DateTime.now());
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Ring in"),
                  Text(
                    firstAlarm != null ? "${hours(d!)}hrs ${minutes(d)}mins" : "No alarm",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("To determine"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "It will be",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                        size: 60.0,
                      ),
                      Column(
                        children: [
                          Text(
                            "${weather.temperature}°C",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${weather.minTemperature}°/${weather.maxTemperature}°",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            weather.type,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${weather.humidity.toString()}% humidity",
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        TextSpan(text: weather.location.locality),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
