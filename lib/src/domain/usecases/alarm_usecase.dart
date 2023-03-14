import 'package:alarm/src/domain/entities/alarm.dart';
import '../../core/resources/data_state.dart';
import '../entities/weather.dart';
import '../repositories/alarm_repository.dart';

class AlarmUseCase {
  final AlarmRepository alarmRepository;

  AlarmUseCase({required this.alarmRepository});

  Future<DataState<List<Alarm>>> getAlarms() {
    return alarmRepository.getAlarms();
  }

  Future<DataState<Weather>> getWeather(
      {required double latitude,
      required double longitude,
      required DateTime alarmTime}) {
    return alarmRepository.getWeather(latitude, longitude, alarmTime);
  }
}
