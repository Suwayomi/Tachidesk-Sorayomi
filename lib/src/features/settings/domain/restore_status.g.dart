// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restore_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestoreStatusImpl _$$RestoreStatusImplFromJson(Map<String, dynamic> json) =>
    _$RestoreStatusImpl(
      mangaProgress: json['mangaProgress'] as int?,
      state: $enumDecodeNullable(_$RestoreStateEnumMap, json['state']),
      totalManga: json['totalManga'] as int?,
    );

Map<String, dynamic> _$$RestoreStatusImplToJson(_$RestoreStatusImpl instance) =>
    <String, dynamic>{
      'mangaProgress': instance.mangaProgress,
      'state': _$RestoreStateEnumMap[instance.state],
      'totalManga': instance.totalManga,
    };

const _$RestoreStateEnumMap = {
  RestoreState.idle: 'IDLE',
  RestoreState.success: 'SUCCESS',
  RestoreState.failure: 'FAILURE',
  RestoreState.restoringCategories: 'RESTORING_CATEGORIES',
  RestoreState.restoringManga: 'RESTORING_MANGA',
};
