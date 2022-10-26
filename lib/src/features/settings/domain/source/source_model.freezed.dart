// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Source _$SourceFromJson(Map<String, dynamic> json) {
  return _Source.fromJson(json);
}

/// @nodoc
mixin _$Source {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  bool? get supportsLatest => throw _privateConstructorUsedError;
  bool? get isConfigurable => throw _privateConstructorUsedError;
  bool? get isNsfw => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res, Source>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? lang,
      String? iconUrl,
      bool? supportsLatest,
      bool? isConfigurable,
      bool? isNsfw,
      String? displayName});
}

/// @nodoc
class _$SourceCopyWithImpl<$Res, $Val extends Source>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lang = freezed,
    Object? iconUrl = freezed,
    Object? supportsLatest = freezed,
    Object? isConfigurable = freezed,
    Object? isNsfw = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supportsLatest: freezed == supportsLatest
          ? _value.supportsLatest
          : supportsLatest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConfigurable: freezed == isConfigurable
          ? _value.isConfigurable
          : isConfigurable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNsfw: freezed == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SourceCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$_SourceCopyWith(_$_Source value, $Res Function(_$_Source) then) =
      __$$_SourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? lang,
      String? iconUrl,
      bool? supportsLatest,
      bool? isConfigurable,
      bool? isNsfw,
      String? displayName});
}

/// @nodoc
class __$$_SourceCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$_Source>
    implements _$$_SourceCopyWith<$Res> {
  __$$_SourceCopyWithImpl(_$_Source _value, $Res Function(_$_Source) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lang = freezed,
    Object? iconUrl = freezed,
    Object? supportsLatest = freezed,
    Object? isConfigurable = freezed,
    Object? isNsfw = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$_Source(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supportsLatest: freezed == supportsLatest
          ? _value.supportsLatest
          : supportsLatest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConfigurable: freezed == isConfigurable
          ? _value.isConfigurable
          : isConfigurable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNsfw: freezed == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Source implements _Source {
  _$_Source(
      {this.id,
      this.name,
      this.lang,
      this.iconUrl,
      this.supportsLatest,
      this.isConfigurable,
      this.isNsfw,
      this.displayName});

  factory _$_Source.fromJson(Map<String, dynamic> json) =>
      _$$_SourceFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? lang;
  @override
  final String? iconUrl;
  @override
  final bool? supportsLatest;
  @override
  final bool? isConfigurable;
  @override
  final bool? isNsfw;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'Source(id: $id, name: $name, lang: $lang, iconUrl: $iconUrl, supportsLatest: $supportsLatest, isConfigurable: $isConfigurable, isNsfw: $isNsfw, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Source &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.supportsLatest, supportsLatest) ||
                other.supportsLatest == supportsLatest) &&
            (identical(other.isConfigurable, isConfigurable) ||
                other.isConfigurable == isConfigurable) &&
            (identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lang, iconUrl,
      supportsLatest, isConfigurable, isNsfw, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SourceCopyWith<_$_Source> get copyWith =>
      __$$_SourceCopyWithImpl<_$_Source>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SourceToJson(
      this,
    );
  }
}

abstract class _Source implements Source {
  factory _Source(
      {final String? id,
      final String? name,
      final String? lang,
      final String? iconUrl,
      final bool? supportsLatest,
      final bool? isConfigurable,
      final bool? isNsfw,
      final String? displayName}) = _$_Source;

  factory _Source.fromJson(Map<String, dynamic> json) = _$_Source.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get lang;
  @override
  String? get iconUrl;
  @override
  bool? get supportsLatest;
  @override
  bool? get isConfigurable;
  @override
  bool? get isNsfw;
  @override
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$_SourceCopyWith<_$_Source> get copyWith =>
      throw _privateConstructorUsedError;
}
