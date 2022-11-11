// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerUpdate _$ServerUpdateFromJson(Map<String, dynamic> json) {
  return _ServerUpdate.fromJson(json);
}

/// @nodoc
mixin _$ServerUpdate {
  String? get channel => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerUpdateCopyWith<ServerUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerUpdateCopyWith<$Res> {
  factory $ServerUpdateCopyWith(
          ServerUpdate value, $Res Function(ServerUpdate) then) =
      _$ServerUpdateCopyWithImpl<$Res, ServerUpdate>;
  @useResult
  $Res call({String? channel, String? tag, String? url});
}

/// @nodoc
class _$ServerUpdateCopyWithImpl<$Res, $Val extends ServerUpdate>
    implements $ServerUpdateCopyWith<$Res> {
  _$ServerUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? tag = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServerUpdateCopyWith<$Res>
    implements $ServerUpdateCopyWith<$Res> {
  factory _$$_ServerUpdateCopyWith(
          _$_ServerUpdate value, $Res Function(_$_ServerUpdate) then) =
      __$$_ServerUpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? channel, String? tag, String? url});
}

/// @nodoc
class __$$_ServerUpdateCopyWithImpl<$Res>
    extends _$ServerUpdateCopyWithImpl<$Res, _$_ServerUpdate>
    implements _$$_ServerUpdateCopyWith<$Res> {
  __$$_ServerUpdateCopyWithImpl(
      _$_ServerUpdate _value, $Res Function(_$_ServerUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? tag = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_ServerUpdate(
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServerUpdate implements _ServerUpdate {
  _$_ServerUpdate({this.channel, this.tag, this.url});

  factory _$_ServerUpdate.fromJson(Map<String, dynamic> json) =>
      _$$_ServerUpdateFromJson(json);

  @override
  final String? channel;
  @override
  final String? tag;
  @override
  final String? url;

  @override
  String toString() {
    return 'ServerUpdate(channel: $channel, tag: $tag, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerUpdate &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channel, tag, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerUpdateCopyWith<_$_ServerUpdate> get copyWith =>
      __$$_ServerUpdateCopyWithImpl<_$_ServerUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerUpdateToJson(
      this,
    );
  }
}

abstract class _ServerUpdate implements ServerUpdate {
  factory _ServerUpdate(
      {final String? channel,
      final String? tag,
      final String? url}) = _$_ServerUpdate;

  factory _ServerUpdate.fromJson(Map<String, dynamic> json) =
      _$_ServerUpdate.fromJson;

  @override
  String? get channel;
  @override
  String? get tag;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_ServerUpdateCopyWith<_$_ServerUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
