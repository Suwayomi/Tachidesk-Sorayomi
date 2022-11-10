// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pair_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Pair<F, S> {
  F get first => throw _privateConstructorUsedError;
  S get second => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PairCopyWith<F, S, Pair<F, S>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairCopyWith<F, S, $Res> {
  factory $PairCopyWith(Pair<F, S> value, $Res Function(Pair<F, S>) then) =
      _$PairCopyWithImpl<F, S, $Res, Pair<F, S>>;
  @useResult
  $Res call({F first, S second});
}

/// @nodoc
class _$PairCopyWithImpl<F, S, $Res, $Val extends Pair<F, S>>
    implements $PairCopyWith<F, S, $Res> {
  _$PairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as F,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as S,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PairCopyWith<F, S, $Res>
    implements $PairCopyWith<F, S, $Res> {
  factory _$$_PairCopyWith(
          _$_Pair<F, S> value, $Res Function(_$_Pair<F, S>) then) =
      __$$_PairCopyWithImpl<F, S, $Res>;
  @override
  @useResult
  $Res call({F first, S second});
}

/// @nodoc
class __$$_PairCopyWithImpl<F, S, $Res>
    extends _$PairCopyWithImpl<F, S, $Res, _$_Pair<F, S>>
    implements _$$_PairCopyWith<F, S, $Res> {
  __$$_PairCopyWithImpl(
      _$_Pair<F, S> _value, $Res Function(_$_Pair<F, S>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
  }) {
    return _then(_$_Pair<F, S>(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as F,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as S,
    ));
  }
}

/// @nodoc

class _$_Pair<F, S> implements _Pair<F, S> {
  _$_Pair({required this.first, required this.second});

  @override
  final F first;
  @override
  final S second;

  @override
  String toString() {
    return 'Pair<$F, $S>(first: $first, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pair<F, S> &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.second, second));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(second));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PairCopyWith<F, S, _$_Pair<F, S>> get copyWith =>
      __$$_PairCopyWithImpl<F, S, _$_Pair<F, S>>(this, _$identity);
}

abstract class _Pair<F, S> implements Pair<F, S> {
  factory _Pair({required final F first, required final S second}) =
      _$_Pair<F, S>;

  @override
  F get first;
  @override
  S get second;
  @override
  @JsonKey(ignore: true)
  _$$_PairCopyWith<F, S, _$_Pair<F, S>> get copyWith =>
      throw _privateConstructorUsedError;
}
