// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_missing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BackupMissing _$$_BackupMissingFromJson(Map<String, dynamic> json) =>
    _$_BackupMissing(
      missingSources: (json['missingSources'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      missingTrackers: (json['missingTrackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_BackupMissingToJson(_$_BackupMissing instance) =>
    <String, dynamic>{
      'missingSources': instance.missingSources,
      'missingTrackers': instance.missingTrackers,
    };
