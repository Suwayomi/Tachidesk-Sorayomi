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
abstract class _$$_FilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$$_FilterCopyWith(_$_Filter value, $Res Function(_$_Filter) then) =
      __$$_FilterCopyWithImpl<$Res>;
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
class __$$_FilterCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$_Filter>
    implements _$$_FilterCopyWith<$Res> {
  __$$_FilterCopyWithImpl(_$_Filter _value, $Res Function(_$_Filter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? filterState = freezed,
  }) {
    return _then(_$_Filter(
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
class _$_Filter implements _Filter {
  _$_Filter(
      {this.type,
      @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
          this.filterState});

  factory _$_Filter.fromJson(Map<String, dynamic> json) =>
      _$$_FilterFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Filter &&
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
  _$$_FilterCopyWith<_$_Filter> get copyWith =>
      __$$_FilterCopyWithImpl<_$_Filter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterToJson(
      this,
    );
  }
}

abstract class _Filter implements Filter {
  factory _Filter(
      {final String? type,
      @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
          final FilterState? filterState}) = _$_Filter;

  factory _Filter.fromJson(Map<String, dynamic> json) = _$_Filter.fromJson;

  @override
  String? get type;
  @override
  @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
  FilterState? get filterState;
  @override
  @JsonKey(ignore: true)
  _$$_FilterCopyWith<_$_Filter> get copyWith =>
      throw _privateConstructorUsedError;
}
