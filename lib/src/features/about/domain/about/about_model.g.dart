// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutImpl _$$AboutImplFromJson(Map<String, dynamic> json) => _$AboutImpl(
      name: json['name'] as String?,
      version: json['version'] as String?,
      revision: json['revision'] as String?,
      buildType: json['buildType'] as String?,
      buildTime: json['buildTime'] as int?,
      github: json['github'] as String?,
      discord: json['discord'] as String?,
    );

Map<String, dynamic> _$$AboutImplToJson(_$AboutImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'revision': instance.revision,
      'buildType': instance.buildType,
      'buildTime': instance.buildTime,
      'github': instance.github,
      'discord': instance.discord,
    };
