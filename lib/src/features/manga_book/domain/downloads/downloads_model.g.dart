// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Downloads _$$_DownloadsFromJson(Map<String, dynamic> json) => _$_Downloads(
      queue: (json['queue'] as List<dynamic>?)
          ?.map((e) => DownloadsQueue.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_DownloadsToJson(_$_Downloads instance) =>
    <String, dynamic>{
      'queue': instance.queue?.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };
