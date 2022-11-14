// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateStatus _$UpdateStatusFromJson(Map<String, dynamic> json) {
  return _UpdateStatus.fromJson(json);
}

/// @nodoc
mixin _$UpdateStatus {
  @JsonKey(name: "PENDING")
  List<Manga>? get pending => throw _privateConstructorUsedError;
  @JsonKey(name: "RUNNING")
  List<Manga>? get running => throw _privateConstructorUsedError;
  @JsonKey(name: "COMPLETE")
  List<Manga>? get completed => throw _privateConstructorUsedError;
  @JsonKey(name: "FAILED")
  List<Manga>? get failed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateStatusCopyWith<UpdateStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStatusCopyWith<$Res> {
  factory $UpdateStatusCopyWith(
          UpdateStatus value, $Res Function(UpdateStatus) then) =
      _$UpdateStatusCopyWithImpl<$Res, UpdateStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: "PENDING") List<Manga>? pending,
      @JsonKey(name: "RUNNING") List<Manga>? running,
      @JsonKey(name: "COMPLETE") List<Manga>? completed,
      @JsonKey(name: "FAILED") List<Manga>? failed});
}

/// @nodoc
class _$UpdateStatusCopyWithImpl<$Res, $Val extends UpdateStatus>
    implements $UpdateStatusCopyWith<$Res> {
  _$UpdateStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pending = freezed,
    Object? running = freezed,
    Object? completed = freezed,
    Object? failed = freezed,
  }) {
    return _then(_value.copyWith(
      pending: freezed == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
      running: freezed == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
      failed: freezed == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateStatusCopyWith<$Res>
    implements $UpdateStatusCopyWith<$Res> {
  factory _$$_UpdateStatusCopyWith(
          _$_UpdateStatus value, $Res Function(_$_UpdateStatus) then) =
      __$$_UpdateStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PENDING") List<Manga>? pending,
      @JsonKey(name: "RUNNING") List<Manga>? running,
      @JsonKey(name: "COMPLETE") List<Manga>? completed,
      @JsonKey(name: "FAILED") List<Manga>? failed});
}

/// @nodoc
class __$$_UpdateStatusCopyWithImpl<$Res>
    extends _$UpdateStatusCopyWithImpl<$Res, _$_UpdateStatus>
    implements _$$_UpdateStatusCopyWith<$Res> {
  __$$_UpdateStatusCopyWithImpl(
      _$_UpdateStatus _value, $Res Function(_$_UpdateStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pending = freezed,
    Object? running = freezed,
    Object? completed = freezed,
    Object? failed = freezed,
  }) {
    return _then(_$_UpdateStatus(
      pending: freezed == pending
          ? _value._pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
      running: freezed == running
          ? _value._running
          : running // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
      completed: freezed == completed
          ? _value._completed
          : completed // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
      failed: freezed == failed
          ? _value._failed
          : failed // ignore: cast_nullable_to_non_nullable
              as List<Manga>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateStatus extends _UpdateStatus {
  _$_UpdateStatus(
      {@JsonKey(name: "PENDING") final List<Manga>? pending,
      @JsonKey(name: "RUNNING") final List<Manga>? running,
      @JsonKey(name: "COMPLETE") final List<Manga>? completed,
      @JsonKey(name: "FAILED") final List<Manga>? failed})
      : _pending = pending,
        _running = running,
        _completed = completed,
        _failed = failed,
        super._();

  factory _$_UpdateStatus.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateStatusFromJson(json);

  final List<Manga>? _pending;
  @override
  @JsonKey(name: "PENDING")
  List<Manga>? get pending {
    final value = _pending;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Manga>? _running;
  @override
  @JsonKey(name: "RUNNING")
  List<Manga>? get running {
    final value = _running;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Manga>? _completed;
  @override
  @JsonKey(name: "COMPLETE")
  List<Manga>? get completed {
    final value = _completed;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Manga>? _failed;
  @override
  @JsonKey(name: "FAILED")
  List<Manga>? get failed {
    final value = _failed;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UpdateStatus(pending: $pending, running: $running, completed: $completed, failed: $failed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateStatus &&
            const DeepCollectionEquality().equals(other._pending, _pending) &&
            const DeepCollectionEquality().equals(other._running, _running) &&
            const DeepCollectionEquality()
                .equals(other._completed, _completed) &&
            const DeepCollectionEquality().equals(other._failed, _failed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pending),
      const DeepCollectionEquality().hash(_running),
      const DeepCollectionEquality().hash(_completed),
      const DeepCollectionEquality().hash(_failed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateStatusCopyWith<_$_UpdateStatus> get copyWith =>
      __$$_UpdateStatusCopyWithImpl<_$_UpdateStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateStatusToJson(
      this,
    );
  }
}

abstract class _UpdateStatus extends UpdateStatus {
  factory _UpdateStatus(
      {@JsonKey(name: "PENDING") final List<Manga>? pending,
      @JsonKey(name: "RUNNING") final List<Manga>? running,
      @JsonKey(name: "COMPLETE") final List<Manga>? completed,
      @JsonKey(name: "FAILED") final List<Manga>? failed}) = _$_UpdateStatus;
  _UpdateStatus._() : super._();

  factory _UpdateStatus.fromJson(Map<String, dynamic> json) =
      _$_UpdateStatus.fromJson;

  @override
  @JsonKey(name: "PENDING")
  List<Manga>? get pending;
  @override
  @JsonKey(name: "RUNNING")
  List<Manga>? get running;
  @override
  @JsonKey(name: "COMPLETE")
  List<Manga>? get completed;
  @override
  @JsonKey(name: "FAILED")
  List<Manga>? get failed;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateStatusCopyWith<_$_UpdateStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
