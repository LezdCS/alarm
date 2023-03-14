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
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Sleep time"),
                    const SizedBox(height: 20,),
                    Text(
                      firstAlarm != null ? "${hours(d!)}hrs ${minutes(d)}mins" : "No alarm",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20,),
                    const Text("Next alarm events"),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.onTertiary,
                        child: const Text("No events"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      firstAlarm != null ? "It will be" : "It is now",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Icon(
                          Icons.wb_sunny,
                          color: Colors.yellow,
                          size: 50.0,
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
                              weather.getWeatherString(),
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
                    const SizedBox(height: 8,),
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
            ),
          ],
        ));
  }
}
