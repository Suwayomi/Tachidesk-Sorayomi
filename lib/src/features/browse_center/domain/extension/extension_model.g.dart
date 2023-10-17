// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtensionImpl _$$ExtensionImplFromJson(Map<String, dynamic> json) =>
    _$ExtensionImpl(
      apkName: json['apkName'] as String?,
      hasUpdate: json['hasUpdate'] as bool?,
      iconUrl: json['iconUrl'] as String?,
      installed: json['installed'] as bool?,
      isNsfw: json['isNsfw'] as bool?,
      lang: LanguageJsonConverter.fromJson(json['lang'] as String?),
      name: json['name'] as String?,
      obsolete: json['obsolete'] as bool?,
      pkgName: json['pkgName'] as String?,
      versionCode: json['versionCode'] as int?,
      versionName: json['versionName'] as String?,
    );

Map<String, dynamic> _$$ExtensionImplToJson(_$ExtensionImpl instance) =>
    <String, dynamic>{
      'apkName': instance.apkName,
      'hasUpdate': instance.hasUpdate,
      'iconUrl': instance.iconUrl,
      'installed': instance.installed,
      'isNsfw': instance.isNsfw,
      'lang': LanguageJsonConverter.toJson(instance.lang),
      'name': instance.name,
      'obsolete': instance.obsolete,
      'pkgName': instance.pkgName,
      'versionCode': instance.versionCode,
      'versionName': instance.versionName,
    };
