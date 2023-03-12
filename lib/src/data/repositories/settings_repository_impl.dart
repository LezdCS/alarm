import 'package:get_storage/get_storage.dart';
import 'dart:convert';

import '../../core/resources/data_state.dart';
import '../../domain/entities/settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../entities/settings_dto.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  @override
  Future<DataState<Settings>> getSettings() async {
    final box = GetStorage();
    var settingsString = box.read('settings');
    if (settingsString != null) {
      Map<String, dynamic> settingsJson = jsonDecode(settingsString);
      Settings settings = SettingsDTO.fromJson(settingsJson) as Settings;
      return DataSuccess(settings);
    }

    Settings settings = const Settings();
    return DataSuccess(settings);
  }

  @override
  Future<void> setSettings(Settings settings) async {
    final box = GetStorage();
    String settingsJson = jsonEncode(settings);
    box.write('settings', settingsJson);
  }
}
