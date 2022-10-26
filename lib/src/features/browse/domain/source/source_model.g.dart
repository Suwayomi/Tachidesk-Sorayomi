// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Source _$$_SourceFromJson(Map<String, dynamic> json) => _$_Source(
      displayName: json['displayName'] as String?,
      iconUrl: json['iconUrl'] as String?,
      id: json['id'] as String?,
      isConfigurable: json['isConfigurable'] as bool?,
      isNsfw: json['isNsfw'] as bool?,
      lang: json['lang'] as String?,
      name: json['name'] as String?,
      supportsLatest: json['supportsLatest'] as bool?,
    );

Map<String, dynamic> _$$_SourceToJson(_$_Source instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'iconUrl': instance.iconUrl,
      'id': instance.id,
      'isConfigurable': instance.isConfigurable,
      'isNsfw': instance.isNsfw,
      'lang': instance.lang,
      'name': instance.name,
      'supportsLatest': instance.supportsLatest,
    };
