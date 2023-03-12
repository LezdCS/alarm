import '../../core/resources/data_state.dart';
import '../entities/settings.dart';

abstract class SettingsRepository {
  Future<DataState<Settings>> getSettings();
  Future<void> setSettings(
      Settings settings,
      );
}
