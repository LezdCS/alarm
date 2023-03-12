

import '../../core/resources/data_state.dart';
import '../entities/settings.dart';
import '../repositories/settings_repository.dart';

class SettingsUseCase {
  final SettingsRepository settingsRepository;
  SettingsUseCase({required this.settingsRepository});

  Future<DataState<Settings>> getSettings() {
    return settingsRepository.getSettings();
  }

  Future<void> setSettings({required Settings settings}) {
    return settingsRepository.setSettings(settings);
  }
}
