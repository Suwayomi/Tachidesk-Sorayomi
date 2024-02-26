// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'automatic_backup_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AutomaticBackupSettingsDto {
  int? get backupInterval => throw _privateConstructorUsedError;
  String? get backupPath => throw _privateConstructorUsedError;
  int? get backupTTL => throw _privateConstructorUsedError;
  TimeOfDay? get backupTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AutomaticBackupSettingsDtoCopyWith<AutomaticBackupSettingsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutomaticBackupSettingsDtoCopyWith<$Res> {
  factory $AutomaticBackupSettingsDtoCopyWith(AutomaticBackupSettingsDto value,
          $Res Function(AutomaticBackupSettingsDto) then) =
      _$AutomaticBackupSettingsDtoCopyWithImpl<$Res,
          AutomaticBackupSettingsDto>;
  @useResult
  $Res call(
      {int? backupInterval,
      String? backupPath,
      int? backupTTL,
      TimeOfDay? backupTime});
}

/// @nodoc
class _$AutomaticBackupSettingsDtoCopyWithImpl<$Res,
        $Val extends AutomaticBackupSettingsDto>
    implements $AutomaticBackupSettingsDtoCopyWith<$Res> {
  _$AutomaticBackupSettingsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backupInterval = freezed,
    Object? backupPath = freezed,
    Object? backupTTL = freezed,
    Object? backupTime = freezed,
  }) {
    return _then(_value.copyWith(
      backupInterval: freezed == backupInterval
          ? _value.backupInterval
          : backupInterval // ignore: cast_nullable_to_non_nullable
              as int?,
      backupPath: freezed == backupPath
          ? _value.backupPath
          : backupPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backupTTL: freezed == backupTTL
          ? _value.backupTTL
          : backupTTL // ignore: cast_nullable_to_non_nullable
              as int?,
      backupTime: freezed == backupTime
          ? _value.backupTime
          : backupTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutomaticBackupSettingsDtoImplCopyWith<$Res>
    implements $AutomaticBackupSettingsDtoCopyWith<$Res> {
  factory _$$AutomaticBackupSettingsDtoImplCopyWith(
          _$AutomaticBackupSettingsDtoImpl value,
          $Res Function(_$AutomaticBackupSettingsDtoImpl) then) =
      __$$AutomaticBackupSettingsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? backupInterval,
      String? backupPath,
      int? backupTTL,
      TimeOfDay? backupTime});
}

/// @nodoc
class __$$AutomaticBackupSettingsDtoImplCopyWithImpl<$Res>
    extends _$AutomaticBackupSettingsDtoCopyWithImpl<$Res,
        _$AutomaticBackupSettingsDtoImpl>
    implements _$$AutomaticBackupSettingsDtoImplCopyWith<$Res> {
  __$$AutomaticBackupSettingsDtoImplCopyWithImpl(
      _$AutomaticBackupSettingsDtoImpl _value,
      $Res Function(_$AutomaticBackupSettingsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backupInterval = freezed,
    Object? backupPath = freezed,
    Object? backupTTL = freezed,
    Object? backupTime = freezed,
  }) {
    return _then(_$AutomaticBackupSettingsDtoImpl(
      backupInterval: freezed == backupInterval
          ? _value.backupInterval
          : backupInterval // ignore: cast_nullable_to_non_nullable
              as int?,
      backupPath: freezed == backupPath
          ? _value.backupPath
          : backupPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backupTTL: freezed == backupTTL
          ? _value.backupTTL
          : backupTTL // ignore: cast_nullable_to_non_nullable
              as int?,
      backupTime: freezed == backupTime
          ? _value.backupTime
          : backupTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc

class _$AutomaticBackupSettingsDtoImpl implements _AutomaticBackupSettingsDto {
  _$AutomaticBackupSettingsDtoImpl(
      {this.backupInterval, this.backupPath, this.backupTTL, this.backupTime});

  @override
  final int? backupInterval;
  @override
  final String? backupPath;
  @override
  final int? backupTTL;
  @override
  final TimeOfDay? backupTime;

  @override
  String toString() {
    return 'AutomaticBackupSettingsDto(backupInterval: $backupInterval, backupPath: $backupPath, backupTTL: $backupTTL, backupTime: $backupTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutomaticBackupSettingsDtoImpl &&
            (identical(other.backupInterval, backupInterval) ||
                other.backupInterval == backupInterval) &&
            (identical(other.backupPath, backupPath) ||
                other.backupPath == backupPath) &&
            (identical(other.backupTTL, backupTTL) ||
                other.backupTTL == backupTTL) &&
            (identical(other.backupTime, backupTime) ||
                other.backupTime == backupTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, backupInterval, backupPath, backupTTL, backupTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutomaticBackupSettingsDtoImplCopyWith<_$AutomaticBackupSettingsDtoImpl>
      get copyWith => __$$AutomaticBackupSettingsDtoImplCopyWithImpl<
          _$AutomaticBackupSettingsDtoImpl>(this, _$identity);
}

abstract class _AutomaticBackupSettingsDto
    implements AutomaticBackupSettingsDto {
  factory _AutomaticBackupSettingsDto(
      {final int? backupInterval,
      final String? backupPath,
      final int? backupTTL,
      final TimeOfDay? backupTime}) = _$AutomaticBackupSettingsDtoImpl;

  @override
  int? get backupInterval;
  @override
  String? get backupPath;
  @override
  int? get backupTTL;
  @override
  TimeOfDay? get backupTime;
  @override
  @JsonKey(ignore: true)
  _$$AutomaticBackupSettingsDtoImplCopyWith<_$AutomaticBackupSettingsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
