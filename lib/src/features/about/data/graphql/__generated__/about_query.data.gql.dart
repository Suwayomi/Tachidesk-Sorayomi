// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tachidesk_sorayomi/src/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:tachidesk_sorayomi/src/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'about_query.data.gql.g.dart';

abstract class GAboutData implements Built<GAboutData, GAboutDataBuilder> {
  GAboutData._();

  factory GAboutData([void Function(GAboutDataBuilder b) updates]) =
      _$GAboutData;

  static void _initializeBuilder(GAboutDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAboutData_aboutServer get aboutServer;
  static Serializer<GAboutData> get serializer => _$gAboutDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAboutData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAboutData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAboutData.serializer,
        json,
      );
}

abstract class GAboutData_aboutServer
    implements Built<GAboutData_aboutServer, GAboutData_aboutServerBuilder> {
  GAboutData_aboutServer._();

  factory GAboutData_aboutServer(
          [void Function(GAboutData_aboutServerBuilder b) updates]) =
      _$GAboutData_aboutServer;

  static void _initializeBuilder(GAboutData_aboutServerBuilder b) =>
      b..G__typename = 'AboutServerPayload';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get version;
  String get revision;
  String get buildType;
  _i2.GLongString get buildTime;
  String get discord;
  String get github;
  static Serializer<GAboutData_aboutServer> get serializer =>
      _$gAboutDataAboutServerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAboutData_aboutServer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAboutData_aboutServer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAboutData_aboutServer.serializer,
        json,
      );
}

abstract class GServerUpdateData
    implements Built<GServerUpdateData, GServerUpdateDataBuilder> {
  GServerUpdateData._();

  factory GServerUpdateData(
          [void Function(GServerUpdateDataBuilder b) updates]) =
      _$GServerUpdateData;

  static void _initializeBuilder(GServerUpdateDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GServerUpdateData_checkForServerUpdates> get checkForServerUpdates;
  static Serializer<GServerUpdateData> get serializer =>
      _$gServerUpdateDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GServerUpdateData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GServerUpdateData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GServerUpdateData.serializer,
        json,
      );
}

abstract class GServerUpdateData_checkForServerUpdates
    implements
        Built<GServerUpdateData_checkForServerUpdates,
            GServerUpdateData_checkForServerUpdatesBuilder> {
  GServerUpdateData_checkForServerUpdates._();

  factory GServerUpdateData_checkForServerUpdates(
      [void Function(GServerUpdateData_checkForServerUpdatesBuilder b)
          updates]) = _$GServerUpdateData_checkForServerUpdates;

  static void _initializeBuilder(
          GServerUpdateData_checkForServerUpdatesBuilder b) =>
      b..G__typename = 'CheckForServerUpdatesPayload';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get channel;
  String get tag;
  String get url;
  static Serializer<GServerUpdateData_checkForServerUpdates> get serializer =>
      _$gServerUpdateDataCheckForServerUpdatesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GServerUpdateData_checkForServerUpdates.serializer,
        this,
      ) as Map<String, dynamic>);

  static GServerUpdateData_checkForServerUpdates? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GServerUpdateData_checkForServerUpdates.serializer,
        json,
      );
}
