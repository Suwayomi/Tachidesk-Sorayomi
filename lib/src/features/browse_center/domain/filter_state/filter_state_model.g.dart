// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterHeaderImpl _$$FilterHeaderImplFromJson(Map<String, dynamic> json) =>
    _$FilterHeaderImpl(
      state: json['state'] as int?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterHeaderImplToJson(_$FilterHeaderImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$FilterSeparatorImpl _$$FilterSeparatorImplFromJson(
        Map<String, dynamic> json) =>
    _$FilterSeparatorImpl(
      state: json['state'] as int?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterSeparatorImplToJson(
        _$FilterSeparatorImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$FilterTextImpl _$$FilterTextImplFromJson(Map<String, dynamic> json) =>
    _$FilterTextImpl(
      state: json['state'] as String?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterTextImplToJson(_$FilterTextImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$FilterCheckBoxImpl _$$FilterCheckBoxImplFromJson(Map<String, dynamic> json) =>
    _$FilterCheckBoxImpl(
      state: json['state'] as bool?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterCheckBoxImplToJson(
        _$FilterCheckBoxImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$FilterTriStateImpl _$$FilterTriStateImplFromJson(Map<String, dynamic> json) =>
    _$FilterTriStateImpl(
      state: json['state'] as int?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterTriStateImplToJson(
        _$FilterTriStateImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$FilterSortImpl _$$FilterSortImplFromJson(Map<String, dynamic> json) =>
    _$FilterSortImpl(
      state: json['state'] == null
          ? null
          : SortState.fromJson(json['state'] as Map<String, dynamic>),
      name: json['name'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterSortImplToJson(_$FilterSortImpl instance) =>
    <String, dynamic>{
      'state': instance.state?.toJson(),
      'name': instance.name,
      'values': instance.values,
      'type': instance.$type,
    };

_$FilterSelectImpl _$$FilterSelectImplFromJson(Map<String, dynamic> json) =>
    _$FilterSelectImpl(
      state: json['state'] as int?,
      name: json['name'] as String?,
      displayValues: (json['displayValues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterSelectImplToJson(_$FilterSelectImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'displayValues': instance.displayValues,
      'type': instance.$type,
    };

_$FilterGroupImpl _$$FilterGroupImplFromJson(Map<String, dynamic> json) =>
    _$FilterGroupImpl(
      state: (json['state'] as List<dynamic>?)
          ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilterGroupImplToJson(_$FilterGroupImpl instance) =>
    <String, dynamic>{
      'state': instance.state?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'type': instance.$type,
    };

_$SortStateImpl _$$SortStateImplFromJson(Map<String, dynamic> json) =>
    _$SortStateImpl(
      index: json['index'] as int?,
      ascending: json['ascending'] as bool?,
    );

Map<String, dynamic> _$$SortStateImplToJson(_$SortStateImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'ascending': instance.ascending,
    };

_$SelectValuesImpl _$$SelectValuesImplFromJson(Map<String, dynamic> json) =>
    _$SelectValuesImpl(
      first: json['first'] as String?,
      second: json['second'] as String?,
    );

Map<String, dynamic> _$$SelectValuesImplToJson(_$SelectValuesImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
    };
