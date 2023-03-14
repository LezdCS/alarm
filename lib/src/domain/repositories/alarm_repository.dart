import 'package:alarm/src/domain/entities/weather.dart';

import '../../core/resources/data_state.dart';
import '../entities/alarm.dart';

abstract class AlarmRepository {
  Future<DataState<List<Alarm>>> getAlarms();

  Future<DataState<Weather>> getWeather(
    double latitude,
    double longitude,
    DateTime alarmTime,
  );
}
