// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Filter _$FilterFromJson(Map<String, dynamic> json) {
  return _Filter.fromJson(json);
}

/// @nodoc
mixin _$Filter {
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
  FilterState? get filterState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterCopyWith<Filter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) then) =
      _$FilterCopyWithImpl<$Res, Filter>;
  @useResult
  $Res call(
      {String? type,
      @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
      FilterState? filterState});

  $FilterStateCopyWith<$Res>? get filterState;
}

/// @nodoc
class _$FilterCopyWithImpl<$Res, $Val extends Filter>
    implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? filterState = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      filterState: freezed == filterState
          ? _value.filterState
          : filterState // ignore: cast_nullable_to_non_nullable
              as FilterState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterStateCopyWith<$Res>? get filterState {
    if (_value.filterState == null) {
      return null;
    }

    return $FilterStateCopyWith<$Res>(_value.filterState!, (value) {
      return _then(_value.copyWith(filterState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilterImplCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$$FilterImplCopyWith(
          _$FilterImpl value, $Res Function(_$FilterImpl) then) =
      __$$FilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
      FilterState? filterState});

  @override
  $FilterStateCopyWith<$Res>? get filterState;
}

/// @nodoc
class __$$FilterImplCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$FilterImpl>
    implements _$$FilterImplCopyWith<$Res> {
  __$$FilterImplCopyWithImpl(
      _$FilterImpl _value, $Res Function(_$FilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? filterState = freezed,
  }) {
    return _then(_$FilterImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      filterState: freezed == filterState
          ? _value.filterState
          : filterState // ignore: cast_nullable_to_non_nullable
              as FilterState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterImpl implements _Filter {
  _$FilterImpl(
      {this.type,
      @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
      this.filterState});

  factory _$FilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterImplFromJson(json);

  @override
  final String? type;
  @override
  @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
  final FilterState? filterState;

  @override
  String toString() {
    return 'Filter(type: $type, filterState: $filterState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.filterState, filterState) ||
                other.filterState == filterState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, filterState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      __$$FilterImplCopyWithImpl<_$FilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterImplToJson(
      this,
    );
  }
}

abstract class _Filter implements Filter {
  factory _Filter(
      {final String? type,
      @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
      final FilterState? filterState}) = _$FilterImpl;

  factory _Filter.fromJson(Map<String, dynamic> json) = _$FilterImpl.fromJson;

  @override
  String? get type;
  @override
  @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
  FilterState? get filterState;
  @override
  @JsonKey(ignore: true)
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
