// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterState _$FilterStateFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'Header':
      return _Header.fromJson(json);
    case 'Text':
      return _Text.fromJson(json);
    case 'CheckBox':
      return _CheckBox.fromJson(json);
    case 'TriState':
      return _TriState.fromJson(json);
    case 'Sort':
      return _Sort.fromJson(json);
    case 'Select':
      return _Select.fromJson(json);
    case 'Group':
      return _Group.fromJson(json);

    default:
      return _Separator.fromJson(json);
  }
}

/// @nodoc
mixin _$FilterState {
  Object? get state => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res, FilterState>;
  @useResult
  $Res call({String? name});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeaderCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$$_HeaderCopyWith(_$_Header value, $Res Function(_$_Header) then) =
      __$$_HeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? state, String? name});
}

/// @nodoc
class __$$_HeaderCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_Header>
    implements _$$_HeaderCopyWith<$Res> {
  __$$_HeaderCopyWithImpl(_$_Header _value, $Res Function(_$_Header) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Header(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Header implements _Header {
  const _$_Header({this.state, this.name, final String? $type})
      : $type = $type ?? 'Header';

  factory _$_Header.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderFromJson(json);

  @override
  final int? state;
  @override
  final String? name;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.header(state: $state, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Header &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      __$$_HeaderCopyWithImpl<_$_Header>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return header(state, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return header?.call(state, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(state, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return header(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return header?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderToJson(
      this,
    );
  }
}

abstract class _Header implements FilterState, _FilterStateGeneric<int> {
  const factory _Header({final int? state, final String? name}) = _$_Header;

  factory _Header.fromJson(Map<String, dynamic> json) = _$_Header.fromJson;

  @override
  int? get state;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SeparatorCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$_SeparatorCopyWith(
          _$_Separator value, $Res Function(_$_Separator) then) =
      __$$_SeparatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? state, String? name});
}

/// @nodoc
class __$$_SeparatorCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_Separator>
    implements _$$_SeparatorCopyWith<$Res> {
  __$$_SeparatorCopyWithImpl(
      _$_Separator _value, $Res Function(_$_Separator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Separator(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Separator implements _Separator {
  const _$_Separator({this.state, this.name, final String? $type})
      : $type = $type ?? 'Separator';

  factory _$_Separator.fromJson(Map<String, dynamic> json) =>
      _$$_SeparatorFromJson(json);

  @override
  final int? state;
  @override
  final String? name;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.separator(state: $state, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Separator &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeparatorCopyWith<_$_Separator> get copyWith =>
      __$$_SeparatorCopyWithImpl<_$_Separator>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return separator(state, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return separator?.call(state, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (separator != null) {
      return separator(state, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return separator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return separator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (separator != null) {
      return separator(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeparatorToJson(
      this,
    );
  }
}

abstract class _Separator implements FilterState, _FilterStateGeneric<int> {
  const factory _Separator({final int? state, final String? name}) =
      _$_Separator;

  factory _Separator.fromJson(Map<String, dynamic> json) =
      _$_Separator.fromJson;

  @override
  int? get state;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_SeparatorCopyWith<_$_Separator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TextCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$$_TextCopyWith(_$_Text value, $Res Function(_$_Text) then) =
      __$$_TextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state, String? name});
}

/// @nodoc
class __$$_TextCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_Text>
    implements _$$_TextCopyWith<$Res> {
  __$$_TextCopyWithImpl(_$_Text _value, $Res Function(_$_Text) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Text(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Text implements _Text {
  const _$_Text({this.state, this.name, final String? $type})
      : $type = $type ?? 'Text';

  factory _$_Text.fromJson(Map<String, dynamic> json) => _$$_TextFromJson(json);

  @override
  final String? state;
  @override
  final String? name;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.text(state: $state, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Text &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextCopyWith<_$_Text> get copyWith =>
      __$$_TextCopyWithImpl<_$_Text>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return text(state, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return text?.call(state, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(state, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TextToJson(
      this,
    );
  }
}

abstract class _Text implements FilterState, _FilterStateGeneric<String> {
  const factory _Text({final String? state, final String? name}) = _$_Text;

  factory _Text.fromJson(Map<String, dynamic> json) = _$_Text.fromJson;

  @override
  String? get state;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_TextCopyWith<_$_Text> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckBoxCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$_CheckBoxCopyWith(
          _$_CheckBox value, $Res Function(_$_CheckBox) then) =
      __$$_CheckBoxCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? state, String? name});
}

/// @nodoc
class __$$_CheckBoxCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_CheckBox>
    implements _$$_CheckBoxCopyWith<$Res> {
  __$$_CheckBoxCopyWithImpl(
      _$_CheckBox _value, $Res Function(_$_CheckBox) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_CheckBox(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckBox implements _CheckBox {
  const _$_CheckBox({this.state, this.name, final String? $type})
      : $type = $type ?? 'CheckBox';

  factory _$_CheckBox.fromJson(Map<String, dynamic> json) =>
      _$$_CheckBoxFromJson(json);

  @override
  final bool? state;
  @override
  final String? name;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.checkBox(state: $state, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckBox &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckBoxCopyWith<_$_CheckBox> get copyWith =>
      __$$_CheckBoxCopyWithImpl<_$_CheckBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return checkBox(state, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return checkBox?.call(state, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (checkBox != null) {
      return checkBox(state, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return checkBox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return checkBox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (checkBox != null) {
      return checkBox(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckBoxToJson(
      this,
    );
  }
}

abstract class _CheckBox implements FilterState, _FilterStateGeneric<bool> {
  const factory _CheckBox({final bool? state, final String? name}) =
      _$_CheckBox;

  factory _CheckBox.fromJson(Map<String, dynamic> json) = _$_CheckBox.fromJson;

  @override
  bool? get state;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_CheckBoxCopyWith<_$_CheckBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TriStateCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$_TriStateCopyWith(
          _$_TriState value, $Res Function(_$_TriState) then) =
      __$$_TriStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? state, String? name});
}

/// @nodoc
class __$$_TriStateCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_TriState>
    implements _$$_TriStateCopyWith<$Res> {
  __$$_TriStateCopyWithImpl(
      _$_TriState _value, $Res Function(_$_TriState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_TriState(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TriState implements _TriState {
  const _$_TriState({this.state, this.name, final String? $type})
      : $type = $type ?? 'TriState';

  factory _$_TriState.fromJson(Map<String, dynamic> json) =>
      _$$_TriStateFromJson(json);

  @override
  final int? state;
  @override
  final String? name;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.triState(state: $state, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriStateCopyWith<_$_TriState> get copyWith =>
      __$$_TriStateCopyWithImpl<_$_TriState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return triState(state, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return triState?.call(state, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (triState != null) {
      return triState(state, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return triState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return triState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (triState != null) {
      return triState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TriStateToJson(
      this,
    );
  }
}

abstract class _TriState implements FilterState, _FilterStateGeneric<int> {
  const factory _TriState({final int? state, final String? name}) = _$_TriState;

  factory _TriState.fromJson(Map<String, dynamic> json) = _$_TriState.fromJson;

  @override
  int? get state;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_TriStateCopyWith<_$_TriState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SortCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$$_SortCopyWith(_$_Sort value, $Res Function(_$_Sort) then) =
      __$$_SortCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SortState? state, String? name, List<String>? values});

  $SortStateCopyWith<$Res>? get state;
}

/// @nodoc
class __$$_SortCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_Sort>
    implements _$$_SortCopyWith<$Res> {
  __$$_SortCopyWithImpl(_$_Sort _value, $Res Function(_$_Sort) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
    Object? values = freezed,
  }) {
    return _then(_$_Sort(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SortState?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      values: freezed == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SortStateCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $SortStateCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sort implements _Sort {
  const _$_Sort(
      {this.state, this.name, final List<String>? values, final String? $type})
      : _values = values,
        $type = $type ?? 'Sort';

  factory _$_Sort.fromJson(Map<String, dynamic> json) => _$$_SortFromJson(json);

  @override
  final SortState? state;
  @override
  final String? name;
  final List<String>? _values;
  @override
  List<String>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.sort(state: $state, name: $name, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sort &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, state, name, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortCopyWith<_$_Sort> get copyWith =>
      __$$_SortCopyWithImpl<_$_Sort>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return sort(state, name, values);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return sort?.call(state, name, values);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(state, name, values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return sort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return sort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortToJson(
      this,
    );
  }
}

abstract class _Sort implements FilterState, _FilterStateGeneric<SortState> {
  const factory _Sort(
      {final SortState? state,
      final String? name,
      final List<String>? values}) = _$_Sort;

  factory _Sort.fromJson(Map<String, dynamic> json) = _$_Sort.fromJson;

  @override
  SortState? get state;
  @override
  String? get name;
  List<String>? get values;
  @override
  @JsonKey(ignore: true)
  _$$_SortCopyWith<_$_Sort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$$_SelectCopyWith(_$_Select value, $Res Function(_$_Select) then) =
      __$$_SelectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? state, String? name, List<String>? displayValues});
}

/// @nodoc
class __$$_SelectCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_Select>
    implements _$$_SelectCopyWith<$Res> {
  __$$_SelectCopyWithImpl(_$_Select _value, $Res Function(_$_Select) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
    Object? displayValues = freezed,
  }) {
    return _then(_$_Select(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayValues: freezed == displayValues
          ? _value._displayValues
          : displayValues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Select implements _Select {
  const _$_Select(
      {this.state,
      this.name,
      final List<String>? displayValues,
      final String? $type})
      : _displayValues = displayValues,
        $type = $type ?? 'Select';

  factory _$_Select.fromJson(Map<String, dynamic> json) =>
      _$$_SelectFromJson(json);

  @override
  final int? state;
  @override
  final String? name;
  final List<String>? _displayValues;
  @override
  List<String>? get displayValues {
    final value = _displayValues;
    if (value == null) return null;
    if (_displayValues is EqualUnmodifiableListView) return _displayValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.select(state: $state, name: $name, displayValues: $displayValues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Select &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._displayValues, _displayValues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, name,
      const DeepCollectionEquality().hash(_displayValues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectCopyWith<_$_Select> get copyWith =>
      __$$_SelectCopyWithImpl<_$_Select>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return select(state, name, displayValues);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return select?.call(state, name, displayValues);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(state, name, displayValues);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectToJson(
      this,
    );
  }
}

abstract class _Select implements FilterState, _FilterStateGeneric<int> {
  const factory _Select(
      {final int? state,
      final String? name,
      final List<String>? displayValues}) = _$_Select;

  factory _Select.fromJson(Map<String, dynamic> json) = _$_Select.fromJson;

  @override
  int? get state;
  @override
  String? get name;
  List<String>? get displayValues;
  @override
  @JsonKey(ignore: true)
  _$$_SelectCopyWith<_$_Select> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GroupCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$$_GroupCopyWith(_$_Group value, $Res Function(_$_Group) then) =
      __$$_GroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Filter>? state, String? name});
}

/// @nodoc
class __$$_GroupCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$_Group>
    implements _$$_GroupCopyWith<$Res> {
  __$$_GroupCopyWithImpl(_$_Group _value, $Res Function(_$_Group) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Group(
      state: freezed == state
          ? _value._state
          : state // ignore: cast_nullable_to_non_nullable
              as List<Filter>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group implements _Group {
  const _$_Group({final List<Filter>? state, this.name, final String? $type})
      : _state = state,
        $type = $type ?? 'Group';

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  final List<Filter>? _state;
  @override
  List<Filter>? get state {
    final value = _state;
    if (value == null) return null;
    if (_state is EqualUnmodifiableListView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FilterState.group(state: $state, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Group &&
            const DeepCollectionEquality().equals(other._state, _state) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_state), name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      __$$_GroupCopyWithImpl<_$_Group>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? state, String? name) header,
    required TResult Function(int? state, String? name) separator,
    required TResult Function(String? state, String? name) text,
    required TResult Function(bool? state, String? name) checkBox,
    required TResult Function(int? state, String? name) triState,
    required TResult Function(
            SortState? state, String? name, List<String>? values)
        sort,
    required TResult Function(
            int? state, String? name, List<String>? displayValues)
        select,
    required TResult Function(List<Filter>? state, String? name) group,
  }) {
    return group(state, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? state, String? name)? header,
    TResult? Function(int? state, String? name)? separator,
    TResult? Function(String? state, String? name)? text,
    TResult? Function(bool? state, String? name)? checkBox,
    TResult? Function(int? state, String? name)? triState,
    TResult? Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult? Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult? Function(List<Filter>? state, String? name)? group,
  }) {
    return group?.call(state, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? state, String? name)? header,
    TResult Function(int? state, String? name)? separator,
    TResult Function(String? state, String? name)? text,
    TResult Function(bool? state, String? name)? checkBox,
    TResult Function(int? state, String? name)? triState,
    TResult Function(SortState? state, String? name, List<String>? values)?
        sort,
    TResult Function(int? state, String? name, List<String>? displayValues)?
        select,
    TResult Function(List<Filter>? state, String? name)? group,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(state, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Separator value) separator,
    required TResult Function(_Text value) text,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_TriState value) triState,
    required TResult Function(_Sort value) sort,
    required TResult Function(_Select value) select,
    required TResult Function(_Group value) group,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Separator value)? separator,
    TResult? Function(_Text value)? text,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_TriState value)? triState,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_Select value)? select,
    TResult? Function(_Group value)? group,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Separator value)? separator,
    TResult Function(_Text value)? text,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_TriState value)? triState,
    TResult Function(_Sort value)? sort,
    TResult Function(_Select value)? select,
    TResult Function(_Group value)? group,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(
      this,
    );
  }
}

abstract class _Group
    implements FilterState, _FilterStateGeneric<List<Filter>> {
  const factory _Group({final List<Filter>? state, final String? name}) =
      _$_Group;

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  List<Filter>? get state;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      throw _privateConstructorUsedError;
}

SortState _$SortStateFromJson(Map<String, dynamic> json) {
  return _SortState.fromJson(json);
}

/// @nodoc
mixin _$SortState {
  int? get index => throw _privateConstructorUsedError;
  bool? get ascending => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortStateCopyWith<SortState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortStateCopyWith<$Res> {
  factory $SortStateCopyWith(SortState value, $Res Function(SortState) then) =
      _$SortStateCopyWithImpl<$Res, SortState>;
  @useResult
  $Res call({int? index, bool? ascending});
}

/// @nodoc
class _$SortStateCopyWithImpl<$Res, $Val extends SortState>
    implements $SortStateCopyWith<$Res> {
  _$SortStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? ascending = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      ascending: freezed == ascending
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortStateCopyWith<$Res> implements $SortStateCopyWith<$Res> {
  factory _$$_SortStateCopyWith(
          _$_SortState value, $Res Function(_$_SortState) then) =
      __$$_SortStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? index, bool? ascending});
}

/// @nodoc
class __$$_SortStateCopyWithImpl<$Res>
    extends _$SortStateCopyWithImpl<$Res, _$_SortState>
    implements _$$_SortStateCopyWith<$Res> {
  __$$_SortStateCopyWithImpl(
      _$_SortState _value, $Res Function(_$_SortState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? ascending = freezed,
  }) {
    return _then(_$_SortState(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      ascending: freezed == ascending
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SortState implements _SortState {
  _$_SortState({this.index, this.ascending});

  factory _$_SortState.fromJson(Map<String, dynamic> json) =>
      _$$_SortStateFromJson(json);

  @override
  final int? index;
  @override
  final bool? ascending;

  @override
  String toString() {
    return 'SortState(index: $index, ascending: $ascending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortState &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, ascending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortStateCopyWith<_$_SortState> get copyWith =>
      __$$_SortStateCopyWithImpl<_$_SortState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortStateToJson(
      this,
    );
  }
}

abstract class _SortState implements SortState {
  factory _SortState({final int? index, final bool? ascending}) = _$_SortState;

  factory _SortState.fromJson(Map<String, dynamic> json) =
      _$_SortState.fromJson;

  @override
  int? get index;
  @override
  bool? get ascending;
  @override
  @JsonKey(ignore: true)
  _$$_SortStateCopyWith<_$_SortState> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectValues _$SelectValuesFromJson(Map<String, dynamic> json) {
  return _SelectValues.fromJson(json);
}

/// @nodoc
mixin _$SelectValues {
  String? get first => throw _privateConstructorUsedError;
  String? get second => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectValuesCopyWith<SelectValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectValuesCopyWith<$Res> {
  factory $SelectValuesCopyWith(
          SelectValues value, $Res Function(SelectValues) then) =
      _$SelectValuesCopyWithImpl<$Res, SelectValues>;
  @useResult
  $Res call({String? first, String? second});
}

/// @nodoc
class _$SelectValuesCopyWithImpl<$Res, $Val extends SelectValues>
    implements $SelectValuesCopyWith<$Res> {
  _$SelectValuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_value.copyWith(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectValuesCopyWith<$Res>
    implements $SelectValuesCopyWith<$Res> {
  factory _$$_SelectValuesCopyWith(
          _$_SelectValues value, $Res Function(_$_SelectValues) then) =
      __$$_SelectValuesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? first, String? second});
}

/// @nodoc
class __$$_SelectValuesCopyWithImpl<$Res>
    extends _$SelectValuesCopyWithImpl<$Res, _$_SelectValues>
    implements _$$_SelectValuesCopyWith<$Res> {
  __$$_SelectValuesCopyWithImpl(
      _$_SelectValues _value, $Res Function(_$_SelectValues) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_$_SelectValues(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelectValues implements _SelectValues {
  _$_SelectValues({this.first, this.second});

  factory _$_SelectValues.fromJson(Map<String, dynamic> json) =>
      _$$_SelectValuesFromJson(json);

  @override
  final String? first;
  @override
  final String? second;

  @override
  String toString() {
    return 'SelectValues(first: $first, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectValues &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.second, second) || other.second == second));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, first, second);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectValuesCopyWith<_$_SelectValues> get copyWith =>
      __$$_SelectValuesCopyWithImpl<_$_SelectValues>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectValuesToJson(
      this,
    );
  }
}

abstract class _SelectValues implements SelectValues {
  factory _SelectValues({final String? first, final String? second}) =
      _$_SelectValues;

  factory _SelectValues.fromJson(Map<String, dynamic> json) =
      _$_SelectValues.fromJson;

  @override
  String? get first;
  @override
  String? get second;
  @override
  @JsonKey(ignore: true)
  _$$_SelectValuesCopyWith<_$_SelectValues> get copyWith =>
      throw _privateConstructorUsedError;
}
