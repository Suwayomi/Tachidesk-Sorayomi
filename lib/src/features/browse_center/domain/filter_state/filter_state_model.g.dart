// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Header _$$_HeaderFromJson(Map<String, dynamic> json) => _$_Header(
      state: json['state'] as int?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_HeaderToJson(_$_Header instance) => <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$_Separator _$$_SeparatorFromJson(Map<String, dynamic> json) => _$_Separator(
      state: json['state'] as int?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SeparatorToJson(_$_Separator instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$_Text _$$_TextFromJson(Map<String, dynamic> json) => _$_Text(
      state: json['state'] as String?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_TextToJson(_$_Text instance) => <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$_CheckBox _$$_CheckBoxFromJson(Map<String, dynamic> json) => _$_CheckBox(
      state: json['state'] as bool?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_CheckBoxToJson(_$_CheckBox instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$_TriState _$$_TriStateFromJson(Map<String, dynamic> json) => _$_TriState(
      state: json['state'] as int?,
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_TriStateToJson(_$_TriState instance) =>
    <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'type': instance.$type,
    };

_$_Sort _$$_SortFromJson(Map<String, dynamic> json) => _$_Sort(
      state: json['state'] == null
          ? null
          : SortState.fromJson(json['state'] as Map<String, dynamic>),
      name: json['name'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SortToJson(_$_Sort instance) => <String, dynamic>{
      'state': instance.state?.toJson(),
      'name': instance.name,
      'values': instance.values,
      'type': instance.$type,
    };

_$_Select _$$_SelectFromJson(Map<String, dynamic> json) => _$_Select(
      state: json['state'] as int?,
      name: json['name'] as String?,
      displayValues: (json['displayValues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SelectToJson(_$_Select instance) => <String, dynamic>{
      'state': instance.state,
      'name': instance.name,
      'displayValues': instance.displayValues,
      'type': instance.$type,
    };

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      state: (json['state'] as List<dynamic>?)
          ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'state': instance.state?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'type': instance.$type,
    };

_$_SortState _$$_SortStateFromJson(Map<String, dynamic> json) => _$_SortState(
      index: json['index'] as int?,
      ascending: json['ascending'] as bool?,
    );

Map<String, dynamic> _$$_SortStateToJson(_$_SortState instance) =>
    <String, dynamic>{
      'index': instance.index,
      'ascending': instance.ascending,
    };

_$_SelectValues _$$_SelectValuesFromJson(Map<String, dynamic> json) =>
    _$_SelectValues(
      first: json['first'] as String?,
      second: json['second'] as String?,
    );

Map<String, dynamic> _$$_SelectValuesToJson(_$_SelectValues instance) =>
    <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
    };
