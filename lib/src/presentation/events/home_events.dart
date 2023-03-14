import '../../core/resources/data_state.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/alarm_usecase.dart';
import '../../domain/usecases/settings_usecase.dart';

class HomeEvents {
  HomeEvents({required this.settingsUseCase, required this.alarmUseCase});

  final SettingsUseCase settingsUseCase;
  final AlarmUseCase alarmUseCase;

  Future<DataState<Weather>> getWeather(
      {required double latitude,
      required double longitude,
      required DateTime alarmTime}) {
    return alarmUseCase.getWeather(
        latitude: latitude, longitude: longitude, alarmTime: alarmTime);
  }
}
