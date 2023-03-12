import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_dto.freezed.dart';
part 'settings_dto.g.dart';

@freezed
class SettingsDTO with _$SettingsDTO{

  const factory SettingsDTO({
    @Default([]) List obsConnectionsHistory,
  }) = _SettingsDTO;

  factory SettingsDTO.fromJson(Map<String, Object?> json)
  => _$SettingsDTOFromJson(json);
}
