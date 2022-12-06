// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Downloads _$DownloadsFromJson(Map<String, dynamic> json) {
  return _Downloads.fromJson(json);
}

/// @nodoc
mixin _$Downloads {
  List<DownloadsQueue>? get queue => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadsCopyWith<Downloads> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsCopyWith<$Res> {
  factory $DownloadsCopyWith(Downloads value, $Res Function(Downloads) then) =
      _$DownloadsCopyWithImpl<$Res, Downloads>;
  @useResult
  $Res call({List<DownloadsQueue>? queue, String? status});
}

/// @nodoc
class _$DownloadsCopyWithImpl<$Res, $Val extends Downloads>
    implements $DownloadsCopyWith<$Res> {
  _$DownloadsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queue = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      queue: freezed == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<DownloadsQueue>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DownloadsCopyWith<$Res> implements $DownloadsCopyWith<$Res> {
  factory _$$_DownloadsCopyWith(
          _$_Downloads value, $Res Function(_$_Downloads) then) =
      __$$_DownloadsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DownloadsQueue>? queue, String? status});
}

/// @nodoc
class __$$_DownloadsCopyWithImpl<$Res>
    extends _$DownloadsCopyWithImpl<$Res, _$_Downloads>
    implements _$$_DownloadsCopyWith<$Res> {
  __$$_DownloadsCopyWithImpl(
      _$_Downloads _value, $Res Function(_$_Downloads) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queue = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Downloads(
      queue: freezed == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<DownloadsQueue>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Downloads implements _Downloads {
  _$_Downloads({final List<DownloadsQueue>? queue, this.status})
      : _queue = queue;

  factory _$_Downloads.fromJson(Map<String, dynamic> json) =>
      _$$_DownloadsFromJson(json);

  final List<DownloadsQueue>? _queue;
  @override
  List<DownloadsQueue>? get queue {
    final value = _queue;
    if (value == null) return null;
    if (_queue is EqualUnmodifiableListView) return _queue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'Downloads(queue: $queue, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Downloads &&
            const DeepCollectionEquality().equals(other._queue, _queue) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_queue), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadsCopyWith<_$_Downloads> get copyWith =>
      __$$_DownloadsCopyWithImpl<_$_Downloads>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DownloadsToJson(
      this,
    );
  }
}

abstract class _Downloads implements Downloads {
  factory _Downloads(
      {final List<DownloadsQueue>? queue, final String? status}) = _$_Downloads;

  factory _Downloads.fromJson(Map<String, dynamic> json) =
      _$_Downloads.fromJson;

  @override
  List<DownloadsQueue>? get queue;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadsCopyWith<_$_Downloads> get copyWith =>
      throw _privateConstructorUsedError;
}
