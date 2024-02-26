// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_preference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SourcePreference _$SourcePreferenceFromJson(Map<String, dynamic> json) {
  return _SourcePreference.fromJson(json);
}

/// @nodoc
mixin _$SourcePreference {
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
  SourcePreferenceProp? get sourcePreferenceProp =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourcePreferenceCopyWith<SourcePreference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourcePreferenceCopyWith<$Res> {
  factory $SourcePreferenceCopyWith(
          SourcePreference value, $Res Function(SourcePreference) then) =
      _$SourcePreferenceCopyWithImpl<$Res, SourcePreference>;
  @useResult
  $Res call(
      {String? type,
      @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
      SourcePreferenceProp? sourcePreferenceProp});

  $SourcePreferencePropCopyWith<$Res>? get sourcePreferenceProp;
}

/// @nodoc
class _$SourcePreferenceCopyWithImpl<$Res, $Val extends SourcePreference>
    implements $SourcePreferenceCopyWith<$Res> {
  _$SourcePreferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? sourcePreferenceProp = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePreferenceProp: freezed == sourcePreferenceProp
          ? _value.sourcePreferenceProp
          : sourcePreferenceProp // ignore: cast_nullable_to_non_nullable
              as SourcePreferenceProp?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SourcePreferencePropCopyWith<$Res>? get sourcePreferenceProp {
    if (_value.sourcePreferenceProp == null) {
      return null;
    }

    return $SourcePreferencePropCopyWith<$Res>(_value.sourcePreferenceProp!,
        (value) {
      return _then(_value.copyWith(sourcePreferenceProp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SourcePreferenceImplCopyWith<$Res>
    implements $SourcePreferenceCopyWith<$Res> {
  factory _$$SourcePreferenceImplCopyWith(_$SourcePreferenceImpl value,
          $Res Function(_$SourcePreferenceImpl) then) =
      __$$SourcePreferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
      SourcePreferenceProp? sourcePreferenceProp});

  @override
  $SourcePreferencePropCopyWith<$Res>? get sourcePreferenceProp;
}

/// @nodoc
class __$$SourcePreferenceImplCopyWithImpl<$Res>
    extends _$SourcePreferenceCopyWithImpl<$Res, _$SourcePreferenceImpl>
    implements _$$SourcePreferenceImplCopyWith<$Res> {
  __$$SourcePreferenceImplCopyWithImpl(_$SourcePreferenceImpl _value,
      $Res Function(_$SourcePreferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? sourcePreferenceProp = freezed,
  }) {
    return _then(_$SourcePreferenceImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePreferenceProp: freezed == sourcePreferenceProp
          ? _value.sourcePreferenceProp
          : sourcePreferenceProp // ignore: cast_nullable_to_non_nullable
              as SourcePreferenceProp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourcePreferenceImpl implements _SourcePreference {
  _$SourcePreferenceImpl(
      {this.type,
      @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
      this.sourcePreferenceProp});

  factory _$SourcePreferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourcePreferenceImplFromJson(json);

  @override
  final String? type;
  @override
  @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
  final SourcePreferenceProp? sourcePreferenceProp;

  @override
  String toString() {
    return 'SourcePreference(type: $type, sourcePreferenceProp: $sourcePreferenceProp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourcePreferenceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sourcePreferenceProp, sourcePreferenceProp) ||
                other.sourcePreferenceProp == sourcePreferenceProp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, sourcePreferenceProp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourcePreferenceImplCopyWith<_$SourcePreferenceImpl> get copyWith =>
      __$$SourcePreferenceImplCopyWithImpl<_$SourcePreferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourcePreferenceImplToJson(
      this,
    );
  }
}

abstract class _SourcePreference implements SourcePreference {
  factory _SourcePreference(
          {final String? type,
          @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
          final SourcePreferenceProp? sourcePreferenceProp}) =
      _$SourcePreferenceImpl;

  factory _SourcePreference.fromJson(Map<String, dynamic> json) =
      _$SourcePreferenceImpl.fromJson;

  @override
  String? get type;
  @override
  @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
  SourcePreferenceProp? get sourcePreferenceProp;
  @override
  @JsonKey(ignore: true)
  _$$SourcePreferenceImplCopyWith<_$SourcePreferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
