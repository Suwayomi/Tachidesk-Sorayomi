// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String? get displayName => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  bool? get isConfigurable => throw _privateConstructorUsedError;
  bool? get isNsfw => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: LanguageJsonConverter.fromJson,
      toJson: LanguageJsonConverter.toJson)
  Language? get lang => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get supportsLatest => throw _privateConstructorUsedError;

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
      {String? displayName,
      String? iconUrl,
      String? id,
      bool? isConfigurable,
      bool? isNsfw,
      @JsonKey(
          fromJson: LanguageJsonConverter.fromJson,
          toJson: LanguageJsonConverter.toJson)
      Language? lang,
      String? name,
      bool? supportsLatest});

  $LanguageCopyWith<$Res>? get lang;
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
    Object? displayName = freezed,
    Object? iconUrl = freezed,
    Object? id = freezed,
    Object? isConfigurable = freezed,
    Object? isNsfw = freezed,
    Object? lang = freezed,
    Object? name = freezed,
    Object? supportsLatest = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isConfigurable: freezed == isConfigurable
          ? _value.isConfigurable
          : isConfigurable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNsfw: freezed == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Language?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      supportsLatest: freezed == supportsLatest
          ? _value.supportsLatest
          : supportsLatest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageCopyWith<$Res>? get lang {
    if (_value.lang == null) {
      return null;
    }

    return $LanguageCopyWith<$Res>(_value.lang!, (value) {
      return _then(_value.copyWith(lang: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SourceImplCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$SourceImplCopyWith(
          _$SourceImpl value, $Res Function(_$SourceImpl) then) =
      __$$SourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? displayName,
      String? iconUrl,
      String? id,
      bool? isConfigurable,
      bool? isNsfw,
      @JsonKey(
          fromJson: LanguageJsonConverter.fromJson,
          toJson: LanguageJsonConverter.toJson)
      Language? lang,
      String? name,
      bool? supportsLatest});

  @override
  $LanguageCopyWith<$Res>? get lang;
}

/// @nodoc
class __$$SourceImplCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$SourceImpl>
    implements _$$SourceImplCopyWith<$Res> {
  __$$SourceImplCopyWithImpl(
      _$SourceImpl _value, $Res Function(_$SourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? iconUrl = freezed,
    Object? id = freezed,
    Object? isConfigurable = freezed,
    Object? isNsfw = freezed,
    Object? lang = freezed,
    Object? name = freezed,
    Object? supportsLatest = freezed,
  }) {
    return _then(_$SourceImpl(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isConfigurable: freezed == isConfigurable
          ? _value.isConfigurable
          : isConfigurable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNsfw: freezed == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Language?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      supportsLatest: freezed == supportsLatest
          ? _value.supportsLatest
          : supportsLatest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceImpl implements _Source {
  _$SourceImpl(
      {this.displayName,
      this.iconUrl,
      this.id,
      this.isConfigurable,
      this.isNsfw,
      @JsonKey(
          fromJson: LanguageJsonConverter.fromJson,
          toJson: LanguageJsonConverter.toJson)
      this.lang,
      this.name,
      this.supportsLatest});

  factory _$SourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceImplFromJson(json);

  @override
  final String? displayName;
  @override
  final String? iconUrl;
  @override
  final String? id;
  @override
  final bool? isConfigurable;
  @override
  final bool? isNsfw;
  @override
  @JsonKey(
      fromJson: LanguageJsonConverter.fromJson,
      toJson: LanguageJsonConverter.toJson)
  final Language? lang;
  @override
  final String? name;
  @override
  final bool? supportsLatest;

  @override
  String toString() {
    return 'Source(displayName: $displayName, iconUrl: $iconUrl, id: $id, isConfigurable: $isConfigurable, isNsfw: $isNsfw, lang: $lang, name: $name, supportsLatest: $supportsLatest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isConfigurable, isConfigurable) ||
                other.isConfigurable == isConfigurable) &&
            (identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supportsLatest, supportsLatest) ||
                other.supportsLatest == supportsLatest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, iconUrl, id,
      isConfigurable, isNsfw, lang, name, supportsLatest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      __$$SourceImplCopyWithImpl<_$SourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceImplToJson(
      this,
    );
  }
}

abstract class _Source implements Source {
  factory _Source(
      {final String? displayName,
      final String? iconUrl,
      final String? id,
      final bool? isConfigurable,
      final bool? isNsfw,
      @JsonKey(
          fromJson: LanguageJsonConverter.fromJson,
          toJson: LanguageJsonConverter.toJson)
      final Language? lang,
      final String? name,
      final bool? supportsLatest}) = _$SourceImpl;

  factory _Source.fromJson(Map<String, dynamic> json) = _$SourceImpl.fromJson;

  @override
  String? get displayName;
  @override
  String? get iconUrl;
  @override
  String? get id;
  @override
  bool? get isConfigurable;
  @override
  bool? get isNsfw;
  @override
  @JsonKey(
      fromJson: LanguageJsonConverter.fromJson,
      toJson: LanguageJsonConverter.toJson)
  Language? get lang;
  @override
  String? get name;
  @override
  bool? get supportsLatest;
  @override
  @JsonKey(ignore: true)
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
