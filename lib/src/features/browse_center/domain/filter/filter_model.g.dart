// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterImpl _$$FilterImplFromJson(Map<String, dynamic> json) => _$FilterImpl(
      type: json['type'] as String?,
      filterState: Filter.filterFromJson(json, 'filter') == null
          ? null
          : FilterState.fromJson(
              Filter.filterFromJson(json, 'filter') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FilterImplToJson(_$FilterImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'filter': instance.filterState?.toJson(),
    };
