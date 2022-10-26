// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_About _$$_AboutFromJson(Map<String, dynamic> json) => _$_About(
      name: json['name'] as String?,
      version: json['version'] as String?,
      revision: json['revision'] as String?,
      buildType: json['buildType'] as String?,
      buildTime: json['buildTime'] as int?,
      github: json['github'] as String?,
      discord: json['discord'] as String?,
    );

Map<String, dynamic> _$$_AboutToJson(_$_About instance) => <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'revision': instance.revision,
      'buildType': instance.buildType,
      'buildTime': instance.buildTime,
      'github': instance.github,
      'discord': instance.discord,
    };
