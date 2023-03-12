// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsDTO _$SettingsDTOFromJson(Map<String, dynamic> json) {
  return _SettingsDTO.fromJson(json);
}

/// @nodoc
mixin _$SettingsDTO {
  List<dynamic> get obsConnectionsHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsDTOCopyWith<SettingsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsDTOCopyWith<$Res> {
  factory $SettingsDTOCopyWith(
          SettingsDTO value, $Res Function(SettingsDTO) then) =
      _$SettingsDTOCopyWithImpl<$Res, SettingsDTO>;
  @useResult
  $Res call({List<dynamic> obsConnectionsHistory});
}

/// @nodoc
class _$SettingsDTOCopyWithImpl<$Res, $Val extends SettingsDTO>
    implements $SettingsDTOCopyWith<$Res> {
  _$SettingsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obsConnectionsHistory = null,
  }) {
    return _then(_value.copyWith(
      obsConnectionsHistory: null == obsConnectionsHistory
          ? _value.obsConnectionsHistory
          : obsConnectionsHistory // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsDTOCopyWith<$Res>
    implements $SettingsDTOCopyWith<$Res> {
  factory _$$_SettingsDTOCopyWith(
          _$_SettingsDTO value, $Res Function(_$_SettingsDTO) then) =
      __$$_SettingsDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> obsConnectionsHistory});
}

/// @nodoc
class __$$_SettingsDTOCopyWithImpl<$Res>
    extends _$SettingsDTOCopyWithImpl<$Res, _$_SettingsDTO>
    implements _$$_SettingsDTOCopyWith<$Res> {
  __$$_SettingsDTOCopyWithImpl(
      _$_SettingsDTO _value, $Res Function(_$_SettingsDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obsConnectionsHistory = null,
  }) {
    return _then(_$_SettingsDTO(
      obsConnectionsHistory: null == obsConnectionsHistory
          ? _value._obsConnectionsHistory
          : obsConnectionsHistory // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsDTO implements _SettingsDTO {
  const _$_SettingsDTO({final List<dynamic> obsConnectionsHistory = const []})
      : _obsConnectionsHistory = obsConnectionsHistory;

  factory _$_SettingsDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsDTOFromJson(json);

  final List<dynamic> _obsConnectionsHistory;
  @override
  @JsonKey()
  List<dynamic> get obsConnectionsHistory {
    if (_obsConnectionsHistory is EqualUnmodifiableListView)
      return _obsConnectionsHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_obsConnectionsHistory);
  }

  @override
  String toString() {
    return 'SettingsDTO(obsConnectionsHistory: $obsConnectionsHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsDTO &&
            const DeepCollectionEquality()
                .equals(other._obsConnectionsHistory, _obsConnectionsHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_obsConnectionsHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsDTOCopyWith<_$_SettingsDTO> get copyWith =>
      __$$_SettingsDTOCopyWithImpl<_$_SettingsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsDTOToJson(
      this,
    );
  }
}

abstract class _SettingsDTO implements SettingsDTO {
  const factory _SettingsDTO({final List<dynamic> obsConnectionsHistory}) =
      _$_SettingsDTO;

  factory _SettingsDTO.fromJson(Map<String, dynamic> json) =
      _$_SettingsDTO.fromJson;

  @override
  List<dynamic> get obsConnectionsHistory;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsDTOCopyWith<_$_SettingsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
