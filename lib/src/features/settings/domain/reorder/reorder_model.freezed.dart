// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reorder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reorder _$ReorderFromJson(Map<String, dynamic> json) {
  return _Reorder.fromJson(json);
}

/// @nodoc
mixin _$Reorder {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReorderCopyWith<Reorder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReorderCopyWith<$Res> {
  factory $ReorderCopyWith(Reorder value, $Res Function(Reorder) then) =
      _$ReorderCopyWithImpl<$Res, Reorder>;
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class _$ReorderCopyWithImpl<$Res, $Val extends Reorder>
    implements $ReorderCopyWith<$Res> {
  _$ReorderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReorderCopyWith<$Res> implements $ReorderCopyWith<$Res> {
  factory _$$_ReorderCopyWith(
          _$_Reorder value, $Res Function(_$_Reorder) then) =
      __$$_ReorderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class __$$_ReorderCopyWithImpl<$Res>
    extends _$ReorderCopyWithImpl<$Res, _$_Reorder>
    implements _$$_ReorderCopyWith<$Res> {
  __$$_ReorderCopyWithImpl(_$_Reorder _value, $Res Function(_$_Reorder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_Reorder(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reorder implements _Reorder {
  _$_Reorder({this.from, this.to});

  factory _$_Reorder.fromJson(Map<String, dynamic> json) =>
      _$$_ReorderFromJson(json);

  @override
  final String? from;
  @override
  final String? to;

  @override
  String toString() {
    return 'Reorder(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reorder &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReorderCopyWith<_$_Reorder> get copyWith =>
      __$$_ReorderCopyWithImpl<_$_Reorder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReorderToJson(
      this,
    );
  }
}

abstract class _Reorder implements Reorder {
  factory _Reorder({final String? from, final String? to}) = _$_Reorder;

  factory _Reorder.fromJson(Map<String, dynamic> json) = _$_Reorder.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  @JsonKey(ignore: true)
  _$$_ReorderCopyWith<_$_Reorder> get copyWith =>
      throw _privateConstructorUsedError;
}
