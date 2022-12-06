// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Filter _$$_FilterFromJson(Map<String, dynamic> json) => _$_Filter(
      type: json['type'] as String?,
      filterState: Filter.filterFromJson(json, 'filter') == null
          ? null
          : FilterState.fromJson(
              Filter.filterFromJson(json, 'filter') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FilterToJson(_$_Filter instance) => <String, dynamic>{
      'type': instance.type,
      'filter': instance.filterState?.toJson(),
    };
