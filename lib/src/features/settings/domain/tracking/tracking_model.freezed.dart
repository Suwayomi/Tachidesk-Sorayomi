// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tracker _$TrackerFromJson(Map<String, dynamic> json) {
  return _Tracker.fromJson(json);
}

/// @nodoc
mixin _$Tracker {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool? get isLogin => throw _privateConstructorUsedError;
  String? get authUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackerCopyWith<Tracker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackerCopyWith<$Res> {
  factory $TrackerCopyWith(Tracker value, $Res Function(Tracker) then) =
      _$TrackerCopyWithImpl<$Res, Tracker>;
  @useResult
  $Res call(
      {int? id, String? name, String? icon, bool? isLogin, String? authUrl});
}

/// @nodoc
class _$TrackerCopyWithImpl<$Res, $Val extends Tracker>
    implements $TrackerCopyWith<$Res> {
  _$TrackerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? isLogin = freezed,
    Object? authUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isLogin: freezed == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackerImplCopyWith<$Res> implements $TrackerCopyWith<$Res> {
  factory _$$TrackerImplCopyWith(
          _$TrackerImpl value, $Res Function(_$TrackerImpl) then) =
      __$$TrackerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? name, String? icon, bool? isLogin, String? authUrl});
}

/// @nodoc
class __$$TrackerImplCopyWithImpl<$Res>
    extends _$TrackerCopyWithImpl<$Res, _$TrackerImpl>
    implements _$$TrackerImplCopyWith<$Res> {
  __$$TrackerImplCopyWithImpl(
      _$TrackerImpl _value, $Res Function(_$TrackerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? isLogin = freezed,
    Object? authUrl = freezed,
  }) {
    return _then(_$TrackerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isLogin: freezed == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackerImpl implements _Tracker {
  _$TrackerImpl({this.id, this.name, this.icon, this.isLogin, this.authUrl});

  factory _$TrackerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackerImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final bool? isLogin;
  @override
  final String? authUrl;

  @override
  String toString() {
    return 'Tracker(id: $id, name: $name, icon: $icon, isLogin: $isLogin, authUrl: $authUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.authUrl, authUrl) || other.authUrl == authUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, isLogin, authUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackerImplCopyWith<_$TrackerImpl> get copyWith =>
      __$$TrackerImplCopyWithImpl<_$TrackerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackerImplToJson(
      this,
    );
  }
}

abstract class _Tracker implements Tracker {
  factory _Tracker(
      {final int? id,
      final String? name,
      final String? icon,
      final bool? isLogin,
      final String? authUrl}) = _$TrackerImpl;

  factory _Tracker.fromJson(Map<String, dynamic> json) = _$TrackerImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get icon;
  @override
  bool? get isLogin;
  @override
  String? get authUrl;
  @override
  @JsonKey(ignore: true)
  _$$TrackerImplCopyWith<_$TrackerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MangaTracker _$MangaTrackerFromJson(Map<String, dynamic> json) {
  return _MangaTracker.fromJson(json);
}

/// @nodoc
mixin _$MangaTracker {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  List<int>? get statusList => throw _privateConstructorUsedError;
  Map<int, String>? get statusTextMap => throw _privateConstructorUsedError;
  List<String>? get scoreList => throw _privateConstructorUsedError;
  TrackRecord? get record => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MangaTrackerCopyWith<MangaTracker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaTrackerCopyWith<$Res> {
  factory $MangaTrackerCopyWith(
          MangaTracker value, $Res Function(MangaTracker) then) =
      _$MangaTrackerCopyWithImpl<$Res, MangaTracker>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? icon,
      List<int>? statusList,
      Map<int, String>? statusTextMap,
      List<String>? scoreList,
      TrackRecord? record});

  $TrackRecordCopyWith<$Res>? get record;
}

/// @nodoc
class _$MangaTrackerCopyWithImpl<$Res, $Val extends MangaTracker>
    implements $MangaTrackerCopyWith<$Res> {
  _$MangaTrackerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? statusList = freezed,
    Object? statusTextMap = freezed,
    Object? scoreList = freezed,
    Object? record = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      statusList: freezed == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      statusTextMap: freezed == statusTextMap
          ? _value.statusTextMap
          : statusTextMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>?,
      scoreList: freezed == scoreList
          ? _value.scoreList
          : scoreList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      record: freezed == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as TrackRecord?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TrackRecordCopyWith<$Res>? get record {
    if (_value.record == null) {
      return null;
    }

    return $TrackRecordCopyWith<$Res>(_value.record!, (value) {
      return _then(_value.copyWith(record: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MangaTrackerImplCopyWith<$Res>
    implements $MangaTrackerCopyWith<$Res> {
  factory _$$MangaTrackerImplCopyWith(
          _$MangaTrackerImpl value, $Res Function(_$MangaTrackerImpl) then) =
      __$$MangaTrackerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? icon,
      List<int>? statusList,
      Map<int, String>? statusTextMap,
      List<String>? scoreList,
      TrackRecord? record});

  @override
  $TrackRecordCopyWith<$Res>? get record;
}

/// @nodoc
class __$$MangaTrackerImplCopyWithImpl<$Res>
    extends _$MangaTrackerCopyWithImpl<$Res, _$MangaTrackerImpl>
    implements _$$MangaTrackerImplCopyWith<$Res> {
  __$$MangaTrackerImplCopyWithImpl(
      _$MangaTrackerImpl _value, $Res Function(_$MangaTrackerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? statusList = freezed,
    Object? statusTextMap = freezed,
    Object? scoreList = freezed,
    Object? record = freezed,
  }) {
    return _then(_$MangaTrackerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      statusList: freezed == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      statusTextMap: freezed == statusTextMap
          ? _value._statusTextMap
          : statusTextMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>?,
      scoreList: freezed == scoreList
          ? _value._scoreList
          : scoreList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      record: freezed == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as TrackRecord?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MangaTrackerImpl implements _MangaTracker {
  _$MangaTrackerImpl(
      {this.id,
      this.name,
      this.icon,
      final List<int>? statusList,
      final Map<int, String>? statusTextMap,
      final List<String>? scoreList,
      this.record})
      : _statusList = statusList,
        _statusTextMap = statusTextMap,
        _scoreList = scoreList;

  factory _$MangaTrackerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MangaTrackerImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;
  final List<int>? _statusList;
  @override
  List<int>? get statusList {
    final value = _statusList;
    if (value == null) return null;
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<int, String>? _statusTextMap;
  @override
  Map<int, String>? get statusTextMap {
    final value = _statusTextMap;
    if (value == null) return null;
    if (_statusTextMap is EqualUnmodifiableMapView) return _statusTextMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _scoreList;
  @override
  List<String>? get scoreList {
    final value = _scoreList;
    if (value == null) return null;
    if (_scoreList is EqualUnmodifiableListView) return _scoreList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TrackRecord? record;

  @override
  String toString() {
    return 'MangaTracker(id: $id, name: $name, icon: $icon, statusList: $statusList, statusTextMap: $statusTextMap, scoreList: $scoreList, record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaTrackerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList) &&
            const DeepCollectionEquality()
                .equals(other._statusTextMap, _statusTextMap) &&
            const DeepCollectionEquality()
                .equals(other._scoreList, _scoreList) &&
            (identical(other.record, record) || other.record == record));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      icon,
      const DeepCollectionEquality().hash(_statusList),
      const DeepCollectionEquality().hash(_statusTextMap),
      const DeepCollectionEquality().hash(_scoreList),
      record);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaTrackerImplCopyWith<_$MangaTrackerImpl> get copyWith =>
      __$$MangaTrackerImplCopyWithImpl<_$MangaTrackerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MangaTrackerImplToJson(
      this,
    );
  }
}

abstract class _MangaTracker implements MangaTracker {
  factory _MangaTracker(
      {final int? id,
      final String? name,
      final String? icon,
      final List<int>? statusList,
      final Map<int, String>? statusTextMap,
      final List<String>? scoreList,
      final TrackRecord? record}) = _$MangaTrackerImpl;

  factory _MangaTracker.fromJson(Map<String, dynamic> json) =
      _$MangaTrackerImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get icon;
  @override
  List<int>? get statusList;
  @override
  Map<int, String>? get statusTextMap;
  @override
  List<String>? get scoreList;
  @override
  TrackRecord? get record;
  @override
  @JsonKey(ignore: true)
  _$$MangaTrackerImplCopyWith<_$MangaTrackerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackRecord _$TrackRecordFromJson(Map<String, dynamic> json) {
  return _TrackRecord.fromJson(json);
}

/// @nodoc
mixin _$TrackRecord {
  int? get id => throw _privateConstructorUsedError;
  int? get mangaId => throw _privateConstructorUsedError;
  int? get syncId => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int? get libraryId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  double? get lastChapterRead => throw _privateConstructorUsedError;
  int? get totalChapters => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  String? get scoreString => throw _privateConstructorUsedError;
  String? get remoteUrl => throw _privateConstructorUsedError;
  int? get startDate => throw _privateConstructorUsedError;
  int? get finishDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackRecordCopyWith<TrackRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackRecordCopyWith<$Res> {
  factory $TrackRecordCopyWith(
          TrackRecord value, $Res Function(TrackRecord) then) =
      _$TrackRecordCopyWithImpl<$Res, TrackRecord>;
  @useResult
  $Res call(
      {int? id,
      int? mangaId,
      int? syncId,
      int? remoteId,
      int? libraryId,
      String? title,
      double? lastChapterRead,
      int? totalChapters,
      int? status,
      double? score,
      String? scoreString,
      String? remoteUrl,
      int? startDate,
      int? finishDate});
}

/// @nodoc
class _$TrackRecordCopyWithImpl<$Res, $Val extends TrackRecord>
    implements $TrackRecordCopyWith<$Res> {
  _$TrackRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? syncId = freezed,
    Object? remoteId = freezed,
    Object? libraryId = freezed,
    Object? title = freezed,
    Object? lastChapterRead = freezed,
    Object? totalChapters = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? scoreString = freezed,
    Object? remoteUrl = freezed,
    Object? startDate = freezed,
    Object? finishDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mangaId: freezed == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int?,
      syncId: freezed == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as int?,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      libraryId: freezed == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as double?,
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreString: freezed == scoreString
          ? _value.scoreString
          : scoreString // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteUrl: freezed == remoteUrl
          ? _value.remoteUrl
          : remoteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      finishDate: freezed == finishDate
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackRecordImplCopyWith<$Res>
    implements $TrackRecordCopyWith<$Res> {
  factory _$$TrackRecordImplCopyWith(
          _$TrackRecordImpl value, $Res Function(_$TrackRecordImpl) then) =
      __$$TrackRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? mangaId,
      int? syncId,
      int? remoteId,
      int? libraryId,
      String? title,
      double? lastChapterRead,
      int? totalChapters,
      int? status,
      double? score,
      String? scoreString,
      String? remoteUrl,
      int? startDate,
      int? finishDate});
}

/// @nodoc
class __$$TrackRecordImplCopyWithImpl<$Res>
    extends _$TrackRecordCopyWithImpl<$Res, _$TrackRecordImpl>
    implements _$$TrackRecordImplCopyWith<$Res> {
  __$$TrackRecordImplCopyWithImpl(
      _$TrackRecordImpl _value, $Res Function(_$TrackRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? syncId = freezed,
    Object? remoteId = freezed,
    Object? libraryId = freezed,
    Object? title = freezed,
    Object? lastChapterRead = freezed,
    Object? totalChapters = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? scoreString = freezed,
    Object? remoteUrl = freezed,
    Object? startDate = freezed,
    Object? finishDate = freezed,
  }) {
    return _then(_$TrackRecordImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mangaId: freezed == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int?,
      syncId: freezed == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as int?,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      libraryId: freezed == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as double?,
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreString: freezed == scoreString
          ? _value.scoreString
          : scoreString // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteUrl: freezed == remoteUrl
          ? _value.remoteUrl
          : remoteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      finishDate: freezed == finishDate
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackRecordImpl implements _TrackRecord {
  _$TrackRecordImpl(
      {this.id,
      this.mangaId,
      this.syncId,
      this.remoteId,
      this.libraryId,
      this.title,
      this.lastChapterRead,
      this.totalChapters,
      this.status,
      this.score,
      this.scoreString,
      this.remoteUrl,
      this.startDate,
      this.finishDate});

  factory _$TrackRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackRecordImplFromJson(json);

  @override
  final int? id;
  @override
  final int? mangaId;
  @override
  final int? syncId;
  @override
  final int? remoteId;
  @override
  final int? libraryId;
  @override
  final String? title;
  @override
  final double? lastChapterRead;
  @override
  final int? totalChapters;
  @override
  final int? status;
  @override
  final double? score;
  @override
  final String? scoreString;
  @override
  final String? remoteUrl;
  @override
  final int? startDate;
  @override
  final int? finishDate;

  @override
  String toString() {
    return 'TrackRecord(id: $id, mangaId: $mangaId, syncId: $syncId, remoteId: $remoteId, libraryId: $libraryId, title: $title, lastChapterRead: $lastChapterRead, totalChapters: $totalChapters, status: $status, score: $score, scoreString: $scoreString, remoteUrl: $remoteUrl, startDate: $startDate, finishDate: $finishDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.syncId, syncId) || other.syncId == syncId) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.libraryId, libraryId) ||
                other.libraryId == libraryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastChapterRead, lastChapterRead) ||
                other.lastChapterRead == lastChapterRead) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.scoreString, scoreString) ||
                other.scoreString == scoreString) &&
            (identical(other.remoteUrl, remoteUrl) ||
                other.remoteUrl == remoteUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.finishDate, finishDate) ||
                other.finishDate == finishDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      mangaId,
      syncId,
      remoteId,
      libraryId,
      title,
      lastChapterRead,
      totalChapters,
      status,
      score,
      scoreString,
      remoteUrl,
      startDate,
      finishDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackRecordImplCopyWith<_$TrackRecordImpl> get copyWith =>
      __$$TrackRecordImplCopyWithImpl<_$TrackRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackRecordImplToJson(
      this,
    );
  }
}

abstract class _TrackRecord implements TrackRecord {
  factory _TrackRecord(
      {final int? id,
      final int? mangaId,
      final int? syncId,
      final int? remoteId,
      final int? libraryId,
      final String? title,
      final double? lastChapterRead,
      final int? totalChapters,
      final int? status,
      final double? score,
      final String? scoreString,
      final String? remoteUrl,
      final int? startDate,
      final int? finishDate}) = _$TrackRecordImpl;

  factory _TrackRecord.fromJson(Map<String, dynamic> json) =
      _$TrackRecordImpl.fromJson;

  @override
  int? get id;
  @override
  int? get mangaId;
  @override
  int? get syncId;
  @override
  int? get remoteId;
  @override
  int? get libraryId;
  @override
  String? get title;
  @override
  double? get lastChapterRead;
  @override
  int? get totalChapters;
  @override
  int? get status;
  @override
  double? get score;
  @override
  String? get scoreString;
  @override
  String? get remoteUrl;
  @override
  int? get startDate;
  @override
  int? get finishDate;
  @override
  @JsonKey(ignore: true)
  _$$TrackRecordImplCopyWith<_$TrackRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackSearch _$TrackSearchFromJson(Map<String, dynamic> json) {
  return _TrackSearch.fromJson(json);
}

/// @nodoc
mixin _$TrackSearch {
  int? get id => throw _privateConstructorUsedError;
  int? get mangaId => throw _privateConstructorUsedError;
  int? get syncId => throw _privateConstructorUsedError;
  int? get mediaId => throw _privateConstructorUsedError;
  int? get libraryId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  double? get lastChapterRead => throw _privateConstructorUsedError;
  int? get totalChapters => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get startedReadingDate => throw _privateConstructorUsedError;
  int? get finishedReadingDate => throw _privateConstructorUsedError;
  String? get trackingUrl => throw _privateConstructorUsedError;
  String? get coverUrl => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  String? get publishingStatus => throw _privateConstructorUsedError;
  String? get publishingType => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackSearchCopyWith<TrackSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackSearchCopyWith<$Res> {
  factory $TrackSearchCopyWith(
          TrackSearch value, $Res Function(TrackSearch) then) =
      _$TrackSearchCopyWithImpl<$Res, TrackSearch>;
  @useResult
  $Res call(
      {int? id,
      int? mangaId,
      int? syncId,
      int? mediaId,
      int? libraryId,
      String? title,
      double? lastChapterRead,
      int? totalChapters,
      double? score,
      int? status,
      int? startedReadingDate,
      int? finishedReadingDate,
      String? trackingUrl,
      String? coverUrl,
      String? summary,
      String? publishingStatus,
      String? publishingType,
      String? startDate});
}

/// @nodoc
class _$TrackSearchCopyWithImpl<$Res, $Val extends TrackSearch>
    implements $TrackSearchCopyWith<$Res> {
  _$TrackSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? syncId = freezed,
    Object? mediaId = freezed,
    Object? libraryId = freezed,
    Object? title = freezed,
    Object? lastChapterRead = freezed,
    Object? totalChapters = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? startedReadingDate = freezed,
    Object? finishedReadingDate = freezed,
    Object? trackingUrl = freezed,
    Object? coverUrl = freezed,
    Object? summary = freezed,
    Object? publishingStatus = freezed,
    Object? publishingType = freezed,
    Object? startDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mangaId: freezed == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int?,
      syncId: freezed == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      libraryId: freezed == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as double?,
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      startedReadingDate: freezed == startedReadingDate
          ? _value.startedReadingDate
          : startedReadingDate // ignore: cast_nullable_to_non_nullable
              as int?,
      finishedReadingDate: freezed == finishedReadingDate
          ? _value.finishedReadingDate
          : finishedReadingDate // ignore: cast_nullable_to_non_nullable
              as int?,
      trackingUrl: freezed == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      publishingStatus: freezed == publishingStatus
          ? _value.publishingStatus
          : publishingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      publishingType: freezed == publishingType
          ? _value.publishingType
          : publishingType // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackSearchImplCopyWith<$Res>
    implements $TrackSearchCopyWith<$Res> {
  factory _$$TrackSearchImplCopyWith(
          _$TrackSearchImpl value, $Res Function(_$TrackSearchImpl) then) =
      __$$TrackSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? mangaId,
      int? syncId,
      int? mediaId,
      int? libraryId,
      String? title,
      double? lastChapterRead,
      int? totalChapters,
      double? score,
      int? status,
      int? startedReadingDate,
      int? finishedReadingDate,
      String? trackingUrl,
      String? coverUrl,
      String? summary,
      String? publishingStatus,
      String? publishingType,
      String? startDate});
}

/// @nodoc
class __$$TrackSearchImplCopyWithImpl<$Res>
    extends _$TrackSearchCopyWithImpl<$Res, _$TrackSearchImpl>
    implements _$$TrackSearchImplCopyWith<$Res> {
  __$$TrackSearchImplCopyWithImpl(
      _$TrackSearchImpl _value, $Res Function(_$TrackSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? syncId = freezed,
    Object? mediaId = freezed,
    Object? libraryId = freezed,
    Object? title = freezed,
    Object? lastChapterRead = freezed,
    Object? totalChapters = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? startedReadingDate = freezed,
    Object? finishedReadingDate = freezed,
    Object? trackingUrl = freezed,
    Object? coverUrl = freezed,
    Object? summary = freezed,
    Object? publishingStatus = freezed,
    Object? publishingType = freezed,
    Object? startDate = freezed,
  }) {
    return _then(_$TrackSearchImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mangaId: freezed == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int?,
      syncId: freezed == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      libraryId: freezed == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as double?,
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      startedReadingDate: freezed == startedReadingDate
          ? _value.startedReadingDate
          : startedReadingDate // ignore: cast_nullable_to_non_nullable
              as int?,
      finishedReadingDate: freezed == finishedReadingDate
          ? _value.finishedReadingDate
          : finishedReadingDate // ignore: cast_nullable_to_non_nullable
              as int?,
      trackingUrl: freezed == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      publishingStatus: freezed == publishingStatus
          ? _value.publishingStatus
          : publishingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      publishingType: freezed == publishingType
          ? _value.publishingType
          : publishingType // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackSearchImpl implements _TrackSearch {
  _$TrackSearchImpl(
      {this.id,
      this.mangaId,
      this.syncId,
      this.mediaId,
      this.libraryId,
      this.title,
      this.lastChapterRead,
      this.totalChapters,
      this.score,
      this.status,
      this.startedReadingDate,
      this.finishedReadingDate,
      this.trackingUrl,
      this.coverUrl,
      this.summary,
      this.publishingStatus,
      this.publishingType,
      this.startDate});

  factory _$TrackSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackSearchImplFromJson(json);

  @override
  final int? id;
  @override
  final int? mangaId;
  @override
  final int? syncId;
  @override
  final int? mediaId;
  @override
  final int? libraryId;
  @override
  final String? title;
  @override
  final double? lastChapterRead;
  @override
  final int? totalChapters;
  @override
  final double? score;
  @override
  final int? status;
  @override
  final int? startedReadingDate;
  @override
  final int? finishedReadingDate;
  @override
  final String? trackingUrl;
  @override
  final String? coverUrl;
  @override
  final String? summary;
  @override
  final String? publishingStatus;
  @override
  final String? publishingType;
  @override
  final String? startDate;

  @override
  String toString() {
    return 'TrackSearch(id: $id, mangaId: $mangaId, syncId: $syncId, mediaId: $mediaId, libraryId: $libraryId, title: $title, lastChapterRead: $lastChapterRead, totalChapters: $totalChapters, score: $score, status: $status, startedReadingDate: $startedReadingDate, finishedReadingDate: $finishedReadingDate, trackingUrl: $trackingUrl, coverUrl: $coverUrl, summary: $summary, publishingStatus: $publishingStatus, publishingType: $publishingType, startDate: $startDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackSearchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.syncId, syncId) || other.syncId == syncId) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.libraryId, libraryId) ||
                other.libraryId == libraryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastChapterRead, lastChapterRead) ||
                other.lastChapterRead == lastChapterRead) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedReadingDate, startedReadingDate) ||
                other.startedReadingDate == startedReadingDate) &&
            (identical(other.finishedReadingDate, finishedReadingDate) ||
                other.finishedReadingDate == finishedReadingDate) &&
            (identical(other.trackingUrl, trackingUrl) ||
                other.trackingUrl == trackingUrl) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.publishingStatus, publishingStatus) ||
                other.publishingStatus == publishingStatus) &&
            (identical(other.publishingType, publishingType) ||
                other.publishingType == publishingType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      mangaId,
      syncId,
      mediaId,
      libraryId,
      title,
      lastChapterRead,
      totalChapters,
      score,
      status,
      startedReadingDate,
      finishedReadingDate,
      trackingUrl,
      coverUrl,
      summary,
      publishingStatus,
      publishingType,
      startDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackSearchImplCopyWith<_$TrackSearchImpl> get copyWith =>
      __$$TrackSearchImplCopyWithImpl<_$TrackSearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackSearchImplToJson(
      this,
    );
  }
}

abstract class _TrackSearch implements TrackSearch {
  factory _TrackSearch(
      {final int? id,
      final int? mangaId,
      final int? syncId,
      final int? mediaId,
      final int? libraryId,
      final String? title,
      final double? lastChapterRead,
      final int? totalChapters,
      final double? score,
      final int? status,
      final int? startedReadingDate,
      final int? finishedReadingDate,
      final String? trackingUrl,
      final String? coverUrl,
      final String? summary,
      final String? publishingStatus,
      final String? publishingType,
      final String? startDate}) = _$TrackSearchImpl;

  factory _TrackSearch.fromJson(Map<String, dynamic> json) =
      _$TrackSearchImpl.fromJson;

  @override
  int? get id;
  @override
  int? get mangaId;
  @override
  int? get syncId;
  @override
  int? get mediaId;
  @override
  int? get libraryId;
  @override
  String? get title;
  @override
  double? get lastChapterRead;
  @override
  int? get totalChapters;
  @override
  double? get score;
  @override
  int? get status;
  @override
  int? get startedReadingDate;
  @override
  int? get finishedReadingDate;
  @override
  String? get trackingUrl;
  @override
  String? get coverUrl;
  @override
  String? get summary;
  @override
  String? get publishingStatus;
  @override
  String? get publishingType;
  @override
  String? get startDate;
  @override
  @JsonKey(ignore: true)
  _$$TrackSearchImplCopyWith<_$TrackSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackUpdate _$TrackUpdateFromJson(Map<String, dynamic> json) {
  return _TrackUpdate.fromJson(json);
}

/// @nodoc
mixin _$TrackUpdate {
  int? get recordId => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  double? get lastChapterRead => throw _privateConstructorUsedError;
  String? get scoreString => throw _privateConstructorUsedError;
  int? get startDate => throw _privateConstructorUsedError;
  int? get finishDate => throw _privateConstructorUsedError;
  bool? get unbind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackUpdateCopyWith<TrackUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackUpdateCopyWith<$Res> {
  factory $TrackUpdateCopyWith(
          TrackUpdate value, $Res Function(TrackUpdate) then) =
      _$TrackUpdateCopyWithImpl<$Res, TrackUpdate>;
  @useResult
  $Res call(
      {int? recordId,
      int? status,
      double? lastChapterRead,
      String? scoreString,
      int? startDate,
      int? finishDate,
      bool? unbind});
}

/// @nodoc
class _$TrackUpdateCopyWithImpl<$Res, $Val extends TrackUpdate>
    implements $TrackUpdateCopyWith<$Res> {
  _$TrackUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordId = freezed,
    Object? status = freezed,
    Object? lastChapterRead = freezed,
    Object? scoreString = freezed,
    Object? startDate = freezed,
    Object? finishDate = freezed,
    Object? unbind = freezed,
  }) {
    return _then(_value.copyWith(
      recordId: freezed == recordId
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreString: freezed == scoreString
          ? _value.scoreString
          : scoreString // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      finishDate: freezed == finishDate
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as int?,
      unbind: freezed == unbind
          ? _value.unbind
          : unbind // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackUpdateImplCopyWith<$Res>
    implements $TrackUpdateCopyWith<$Res> {
  factory _$$TrackUpdateImplCopyWith(
          _$TrackUpdateImpl value, $Res Function(_$TrackUpdateImpl) then) =
      __$$TrackUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? recordId,
      int? status,
      double? lastChapterRead,
      String? scoreString,
      int? startDate,
      int? finishDate,
      bool? unbind});
}

/// @nodoc
class __$$TrackUpdateImplCopyWithImpl<$Res>
    extends _$TrackUpdateCopyWithImpl<$Res, _$TrackUpdateImpl>
    implements _$$TrackUpdateImplCopyWith<$Res> {
  __$$TrackUpdateImplCopyWithImpl(
      _$TrackUpdateImpl _value, $Res Function(_$TrackUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordId = freezed,
    Object? status = freezed,
    Object? lastChapterRead = freezed,
    Object? scoreString = freezed,
    Object? startDate = freezed,
    Object? finishDate = freezed,
    Object? unbind = freezed,
  }) {
    return _then(_$TrackUpdateImpl(
      recordId: freezed == recordId
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreString: freezed == scoreString
          ? _value.scoreString
          : scoreString // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      finishDate: freezed == finishDate
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as int?,
      unbind: freezed == unbind
          ? _value.unbind
          : unbind // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackUpdateImpl implements _TrackUpdate {
  _$TrackUpdateImpl(
      {this.recordId,
      this.status,
      this.lastChapterRead,
      this.scoreString,
      this.startDate,
      this.finishDate,
      this.unbind});

  factory _$TrackUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackUpdateImplFromJson(json);

  @override
  final int? recordId;
  @override
  final int? status;
  @override
  final double? lastChapterRead;
  @override
  final String? scoreString;
  @override
  final int? startDate;
  @override
  final int? finishDate;
  @override
  final bool? unbind;

  @override
  String toString() {
    return 'TrackUpdate(recordId: $recordId, status: $status, lastChapterRead: $lastChapterRead, scoreString: $scoreString, startDate: $startDate, finishDate: $finishDate, unbind: $unbind)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackUpdateImpl &&
            (identical(other.recordId, recordId) ||
                other.recordId == recordId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastChapterRead, lastChapterRead) ||
                other.lastChapterRead == lastChapterRead) &&
            (identical(other.scoreString, scoreString) ||
                other.scoreString == scoreString) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.finishDate, finishDate) ||
                other.finishDate == finishDate) &&
            (identical(other.unbind, unbind) || other.unbind == unbind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, recordId, status,
      lastChapterRead, scoreString, startDate, finishDate, unbind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackUpdateImplCopyWith<_$TrackUpdateImpl> get copyWith =>
      __$$TrackUpdateImplCopyWithImpl<_$TrackUpdateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackUpdateImplToJson(
      this,
    );
  }
}

abstract class _TrackUpdate implements TrackUpdate {
  factory _TrackUpdate(
      {final int? recordId,
      final int? status,
      final double? lastChapterRead,
      final String? scoreString,
      final int? startDate,
      final int? finishDate,
      final bool? unbind}) = _$TrackUpdateImpl;

  factory _TrackUpdate.fromJson(Map<String, dynamic> json) =
      _$TrackUpdateImpl.fromJson;

  @override
  int? get recordId;
  @override
  int? get status;
  @override
  double? get lastChapterRead;
  @override
  String? get scoreString;
  @override
  int? get startDate;
  @override
  int? get finishDate;
  @override
  bool? get unbind;
  @override
  @JsonKey(ignore: true)
  _$$TrackUpdateImplCopyWith<_$TrackUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
