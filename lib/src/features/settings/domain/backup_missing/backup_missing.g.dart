// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_missing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackupMissingImpl _$$BackupMissingImplFromJson(Map<String, dynamic> json) =>
    _$BackupMissingImpl(
      missingSources: (json['missingSources'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      missingTrackers: (json['missingTrackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mangasMissingSources: (json['mangasMissingSources'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BackupMissingImplToJson(_$BackupMissingImpl instance) =>
    <String, dynamic>{
      'missingSources': instance.missingSources,
      'missingTrackers': instance.missingTrackers,
      'mangasMissingSources': instance.mangasMissingSources,
    };
