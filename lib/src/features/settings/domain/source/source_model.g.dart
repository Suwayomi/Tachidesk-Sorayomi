// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Source _$$_SourceFromJson(Map<String, dynamic> json) => _$_Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lang: json['lang'] as String?,
      iconUrl: json['iconUrl'] as String?,
      supportsLatest: json['supportsLatest'] as bool?,
      isConfigurable: json['isConfigurable'] as bool?,
      isNsfw: json['isNsfw'] as bool?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$_SourceToJson(_$_Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lang': instance.lang,
      'iconUrl': instance.iconUrl,
      'supportsLatest': instance.supportsLatest,
      'isConfigurable': instance.isConfigurable,
      'isNsfw': instance.isNsfw,
      'displayName': instance.displayName,
    };
