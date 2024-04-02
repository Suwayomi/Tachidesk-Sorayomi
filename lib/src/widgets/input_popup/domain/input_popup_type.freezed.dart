// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_popup_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InputPopupType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? hintText) textField,
    required TResult Function(String? hintText) password,
    required TResult Function(int min, int max) numberPicker,
    required TResult Function(int min, int max) numberSlider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? hintText)? textField,
    TResult? Function(String? hintText)? password,
    TResult? Function(int min, int max)? numberPicker,
    TResult? Function(int min, int max)? numberSlider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? hintText)? textField,
    TResult Function(String? hintText)? password,
    TResult Function(int min, int max)? numberPicker,
    TResult Function(int min, int max)? numberSlider,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextFieldPopup value) textField,
    required TResult Function(PasswordPopup value) password,
    required TResult Function(NumberPickerPopup value) numberPicker,
    required TResult Function(NumberSliderPopup value) numberSlider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextFieldPopup value)? textField,
    TResult? Function(PasswordPopup value)? password,
    TResult? Function(NumberPickerPopup value)? numberPicker,
    TResult? Function(NumberSliderPopup value)? numberSlider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextFieldPopup value)? textField,
    TResult Function(PasswordPopup value)? password,
    TResult Function(NumberPickerPopup value)? numberPicker,
    TResult Function(NumberSliderPopup value)? numberSlider,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputPopupTypeCopyWith<$Res> {
  factory $InputPopupTypeCopyWith(
          InputPopupType value, $Res Function(InputPopupType) then) =
      _$InputPopupTypeCopyWithImpl<$Res, InputPopupType>;
}

/// @nodoc
class _$InputPopupTypeCopyWithImpl<$Res, $Val extends InputPopupType>
    implements $InputPopupTypeCopyWith<$Res> {
  _$InputPopupTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TextFieldPopupImplCopyWith<$Res> {
  factory _$$TextFieldPopupImplCopyWith(_$TextFieldPopupImpl value,
          $Res Function(_$TextFieldPopupImpl) then) =
      __$$TextFieldPopupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? hintText});
}

/// @nodoc
class __$$TextFieldPopupImplCopyWithImpl<$Res>
    extends _$InputPopupTypeCopyWithImpl<$Res, _$TextFieldPopupImpl>
    implements _$$TextFieldPopupImplCopyWith<$Res> {
  __$$TextFieldPopupImplCopyWithImpl(
      _$TextFieldPopupImpl _value, $Res Function(_$TextFieldPopupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hintText = freezed,
  }) {
    return _then(_$TextFieldPopupImpl(
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TextFieldPopupImpl implements TextFieldPopup {
  const _$TextFieldPopupImpl({this.hintText});

  @override
  final String? hintText;

  @override
  String toString() {
    return 'InputPopupType.textField(hintText: $hintText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextFieldPopupImpl &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hintText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextFieldPopupImplCopyWith<_$TextFieldPopupImpl> get copyWith =>
      __$$TextFieldPopupImplCopyWithImpl<_$TextFieldPopupImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? hintText) textField,
    required TResult Function(String? hintText) password,
    required TResult Function(int min, int max) numberPicker,
    required TResult Function(int min, int max) numberSlider,
  }) {
    return textField(hintText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? hintText)? textField,
    TResult? Function(String? hintText)? password,
    TResult? Function(int min, int max)? numberPicker,
    TResult? Function(int min, int max)? numberSlider,
  }) {
    return textField?.call(hintText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? hintText)? textField,
    TResult Function(String? hintText)? password,
    TResult Function(int min, int max)? numberPicker,
    TResult Function(int min, int max)? numberSlider,
    required TResult orElse(),
  }) {
    if (textField != null) {
      return textField(hintText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextFieldPopup value) textField,
    required TResult Function(PasswordPopup value) password,
    required TResult Function(NumberPickerPopup value) numberPicker,
    required TResult Function(NumberSliderPopup value) numberSlider,
  }) {
    return textField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextFieldPopup value)? textField,
    TResult? Function(PasswordPopup value)? password,
    TResult? Function(NumberPickerPopup value)? numberPicker,
    TResult? Function(NumberSliderPopup value)? numberSlider,
  }) {
    return textField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextFieldPopup value)? textField,
    TResult Function(PasswordPopup value)? password,
    TResult Function(NumberPickerPopup value)? numberPicker,
    TResult Function(NumberSliderPopup value)? numberSlider,
    required TResult orElse(),
  }) {
    if (textField != null) {
      return textField(this);
    }
    return orElse();
  }
}

abstract class TextFieldPopup implements InputPopupType {
  const factory TextFieldPopup({final String? hintText}) = _$TextFieldPopupImpl;

  String? get hintText;
  @JsonKey(ignore: true)
  _$$TextFieldPopupImplCopyWith<_$TextFieldPopupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordPopupImplCopyWith<$Res> {
  factory _$$PasswordPopupImplCopyWith(
          _$PasswordPopupImpl value, $Res Function(_$PasswordPopupImpl) then) =
      __$$PasswordPopupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? hintText});
}

/// @nodoc
class __$$PasswordPopupImplCopyWithImpl<$Res>
    extends _$InputPopupTypeCopyWithImpl<$Res, _$PasswordPopupImpl>
    implements _$$PasswordPopupImplCopyWith<$Res> {
  __$$PasswordPopupImplCopyWithImpl(
      _$PasswordPopupImpl _value, $Res Function(_$PasswordPopupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hintText = freezed,
  }) {
    return _then(_$PasswordPopupImpl(
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PasswordPopupImpl implements PasswordPopup {
  const _$PasswordPopupImpl({this.hintText});

  @override
  final String? hintText;

  @override
  String toString() {
    return 'InputPopupType.password(hintText: $hintText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordPopupImpl &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hintText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordPopupImplCopyWith<_$PasswordPopupImpl> get copyWith =>
      __$$PasswordPopupImplCopyWithImpl<_$PasswordPopupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? hintText) textField,
    required TResult Function(String? hintText) password,
    required TResult Function(int min, int max) numberPicker,
    required TResult Function(int min, int max) numberSlider,
  }) {
    return password(hintText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? hintText)? textField,
    TResult? Function(String? hintText)? password,
    TResult? Function(int min, int max)? numberPicker,
    TResult? Function(int min, int max)? numberSlider,
  }) {
    return password?.call(hintText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? hintText)? textField,
    TResult Function(String? hintText)? password,
    TResult Function(int min, int max)? numberPicker,
    TResult Function(int min, int max)? numberSlider,
    required TResult orElse(),
  }) {
    if (password != null) {
      return password(hintText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextFieldPopup value) textField,
    required TResult Function(PasswordPopup value) password,
    required TResult Function(NumberPickerPopup value) numberPicker,
    required TResult Function(NumberSliderPopup value) numberSlider,
  }) {
    return password(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextFieldPopup value)? textField,
    TResult? Function(PasswordPopup value)? password,
    TResult? Function(NumberPickerPopup value)? numberPicker,
    TResult? Function(NumberSliderPopup value)? numberSlider,
  }) {
    return password?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextFieldPopup value)? textField,
    TResult Function(PasswordPopup value)? password,
    TResult Function(NumberPickerPopup value)? numberPicker,
    TResult Function(NumberSliderPopup value)? numberSlider,
    required TResult orElse(),
  }) {
    if (password != null) {
      return password(this);
    }
    return orElse();
  }
}

abstract class PasswordPopup implements InputPopupType {
  const factory PasswordPopup({final String? hintText}) = _$PasswordPopupImpl;

  String? get hintText;
  @JsonKey(ignore: true)
  _$$PasswordPopupImplCopyWith<_$PasswordPopupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberPickerPopupImplCopyWith<$Res> {
  factory _$$NumberPickerPopupImplCopyWith(_$NumberPickerPopupImpl value,
          $Res Function(_$NumberPickerPopupImpl) then) =
      __$$NumberPickerPopupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$$NumberPickerPopupImplCopyWithImpl<$Res>
    extends _$InputPopupTypeCopyWithImpl<$Res, _$NumberPickerPopupImpl>
    implements _$$NumberPickerPopupImplCopyWith<$Res> {
  __$$NumberPickerPopupImplCopyWithImpl(_$NumberPickerPopupImpl _value,
      $Res Function(_$NumberPickerPopupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$NumberPickerPopupImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NumberPickerPopupImpl implements NumberPickerPopup {
  const _$NumberPickerPopupImpl({required this.min, required this.max});

  @override
  final int min;
  @override
  final int max;

  @override
  String toString() {
    return 'InputPopupType.numberPicker(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberPickerPopupImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberPickerPopupImplCopyWith<_$NumberPickerPopupImpl> get copyWith =>
      __$$NumberPickerPopupImplCopyWithImpl<_$NumberPickerPopupImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? hintText) textField,
    required TResult Function(String? hintText) password,
    required TResult Function(int min, int max) numberPicker,
    required TResult Function(int min, int max) numberSlider,
  }) {
    return numberPicker(min, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? hintText)? textField,
    TResult? Function(String? hintText)? password,
    TResult? Function(int min, int max)? numberPicker,
    TResult? Function(int min, int max)? numberSlider,
  }) {
    return numberPicker?.call(min, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? hintText)? textField,
    TResult Function(String? hintText)? password,
    TResult Function(int min, int max)? numberPicker,
    TResult Function(int min, int max)? numberSlider,
    required TResult orElse(),
  }) {
    if (numberPicker != null) {
      return numberPicker(min, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextFieldPopup value) textField,
    required TResult Function(PasswordPopup value) password,
    required TResult Function(NumberPickerPopup value) numberPicker,
    required TResult Function(NumberSliderPopup value) numberSlider,
  }) {
    return numberPicker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextFieldPopup value)? textField,
    TResult? Function(PasswordPopup value)? password,
    TResult? Function(NumberPickerPopup value)? numberPicker,
    TResult? Function(NumberSliderPopup value)? numberSlider,
  }) {
    return numberPicker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextFieldPopup value)? textField,
    TResult Function(PasswordPopup value)? password,
    TResult Function(NumberPickerPopup value)? numberPicker,
    TResult Function(NumberSliderPopup value)? numberSlider,
    required TResult orElse(),
  }) {
    if (numberPicker != null) {
      return numberPicker(this);
    }
    return orElse();
  }
}

abstract class NumberPickerPopup implements InputPopupType {
  const factory NumberPickerPopup(
      {required final int min,
      required final int max}) = _$NumberPickerPopupImpl;

  int get min;
  int get max;
  @JsonKey(ignore: true)
  _$$NumberPickerPopupImplCopyWith<_$NumberPickerPopupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberSliderPopupImplCopyWith<$Res> {
  factory _$$NumberSliderPopupImplCopyWith(_$NumberSliderPopupImpl value,
          $Res Function(_$NumberSliderPopupImpl) then) =
      __$$NumberSliderPopupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$$NumberSliderPopupImplCopyWithImpl<$Res>
    extends _$InputPopupTypeCopyWithImpl<$Res, _$NumberSliderPopupImpl>
    implements _$$NumberSliderPopupImplCopyWith<$Res> {
  __$$NumberSliderPopupImplCopyWithImpl(_$NumberSliderPopupImpl _value,
      $Res Function(_$NumberSliderPopupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$NumberSliderPopupImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NumberSliderPopupImpl implements NumberSliderPopup {
  const _$NumberSliderPopupImpl({required this.min, required this.max});

  @override
  final int min;
  @override
  final int max;

  @override
  String toString() {
    return 'InputPopupType.numberSlider(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberSliderPopupImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberSliderPopupImplCopyWith<_$NumberSliderPopupImpl> get copyWith =>
      __$$NumberSliderPopupImplCopyWithImpl<_$NumberSliderPopupImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? hintText) textField,
    required TResult Function(String? hintText) password,
    required TResult Function(int min, int max) numberPicker,
    required TResult Function(int min, int max) numberSlider,
  }) {
    return numberSlider(min, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? hintText)? textField,
    TResult? Function(String? hintText)? password,
    TResult? Function(int min, int max)? numberPicker,
    TResult? Function(int min, int max)? numberSlider,
  }) {
    return numberSlider?.call(min, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? hintText)? textField,
    TResult Function(String? hintText)? password,
    TResult Function(int min, int max)? numberPicker,
    TResult Function(int min, int max)? numberSlider,
    required TResult orElse(),
  }) {
    if (numberSlider != null) {
      return numberSlider(min, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextFieldPopup value) textField,
    required TResult Function(PasswordPopup value) password,
    required TResult Function(NumberPickerPopup value) numberPicker,
    required TResult Function(NumberSliderPopup value) numberSlider,
  }) {
    return numberSlider(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextFieldPopup value)? textField,
    TResult? Function(PasswordPopup value)? password,
    TResult? Function(NumberPickerPopup value)? numberPicker,
    TResult? Function(NumberSliderPopup value)? numberSlider,
  }) {
    return numberSlider?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextFieldPopup value)? textField,
    TResult Function(PasswordPopup value)? password,
    TResult Function(NumberPickerPopup value)? numberPicker,
    TResult Function(NumberSliderPopup value)? numberSlider,
    required TResult orElse(),
  }) {
    if (numberSlider != null) {
      return numberSlider(this);
    }
    return orElse();
  }
}

abstract class NumberSliderPopup implements InputPopupType {
  const factory NumberSliderPopup(
      {required final int min,
      required final int max}) = _$NumberSliderPopupImpl;

  int get min;
  int get max;
  @JsonKey(ignore: true)
  _$$NumberSliderPopupImplCopyWith<_$NumberSliderPopupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
