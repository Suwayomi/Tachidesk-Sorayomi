// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourcePreferenceImpl _$$SourcePreferenceImplFromJson(
        Map<String, dynamic> json) =>
    _$SourcePreferenceImpl(
      type: json['type'] as String?,
      sourcePreferenceProp:
          SourcePreference.propsFromJson(json, 'props') == null
              ? null
              : SourcePreferenceProp.fromJson(
                  SourcePreference.propsFromJson(json, 'props')
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SourcePreferenceImplToJson(
        _$SourcePreferenceImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'props': instance.sourcePreferenceProp?.toJson(),
    };
