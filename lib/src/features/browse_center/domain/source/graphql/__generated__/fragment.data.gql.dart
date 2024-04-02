// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i3;
import 'package:tachidesk_sorayomi/src/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:tachidesk_sorayomi/src/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'fragment.data.gql.g.dart';

abstract class GSourceFragment {
  String get G__typename;
  String get displayName;
  String get iconUrl;
  _i1.GLongString get id;
  bool get isConfigurable;
  bool get isNsfw;
  String get lang;
  String get name;
  bool get supportsLatest;
  GSourceFragment_extension get extension;
  Map<String, dynamic> toJson();
}

abstract class GSourceFragment_extension {
  String get G__typename;
  String get pkgName;
  String? get repo;
  Map<String, dynamic> toJson();
}

abstract class GSourceFragmentData
    implements
        Built<GSourceFragmentData, GSourceFragmentDataBuilder>,
        GSourceFragment {
  GSourceFragmentData._();

  factory GSourceFragmentData(
          [void Function(GSourceFragmentDataBuilder b) updates]) =
      _$GSourceFragmentData;

  static void _initializeBuilder(GSourceFragmentDataBuilder b) =>
      b..G__typename = 'SourceType';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get iconUrl;
  @override
  _i1.GLongString get id;
  @override
  bool get isConfigurable;
  @override
  bool get isNsfw;
  @override
  String get lang;
  @override
  String get name;
  @override
  bool get supportsLatest;
  @override
  GSourceFragmentData_extension get extension;
  static Serializer<GSourceFragmentData> get serializer =>
      _$gSourceFragmentDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSourceFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSourceFragmentData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSourceFragmentData.serializer,
        json,
      );
}

abstract class GSourceFragmentData_extension
    implements
        Built<GSourceFragmentData_extension,
            GSourceFragmentData_extensionBuilder>,
        GSourceFragment_extension {
  GSourceFragmentData_extension._();

  factory GSourceFragmentData_extension(
          [void Function(GSourceFragmentData_extensionBuilder b) updates]) =
      _$GSourceFragmentData_extension;

  static void _initializeBuilder(GSourceFragmentData_extensionBuilder b) =>
      b..G__typename = 'ExtensionType';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get pkgName;
  @override
  String? get repo;
  static Serializer<GSourceFragmentData_extension> get serializer =>
      _$gSourceFragmentDataExtensionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSourceFragmentData_extension.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSourceFragmentData_extension? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSourceFragmentData_extension.serializer,
        json,
      );
}

abstract class GFullSourceFragment implements GSourceFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get iconUrl;
  @override
  _i1.GLongString get id;
  @override
  bool get isConfigurable;
  @override
  bool get isNsfw;
  @override
  String get lang;
  @override
  String get name;
  @override
  bool get supportsLatest;
  @override
  GFullSourceFragment_extension get extension;
  BuiltList<GFullSourceFragment_filters> get filters;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_extension
    implements GSourceFragment_extension {
  @override
  String get G__typename;
  @override
  String get pkgName;
  @override
  String? get repo;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters {
  String get G__typename;
}

abstract class GFullSourceFragment_filters__base
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asCheckBoxFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  bool get CheckBoxFilterDefault;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asHeaderFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asSelectFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  int get SelectFilterDefault;
  String get name;
  BuiltList<String> get Gvalues;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asTriStateFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  _i1.GTriState get TriStateFilterDefault;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asTextFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  String get TextFilterDefault;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asSortFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  GFullSourceFragment_filters__asSortFilter_SortFilterDefault?
      get SortFilterDefault;
  String get name;
  BuiltList<String> get Gvalues;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asSortFilter_SortFilterDefault {
  String get G__typename;
  bool get ascending;
  int get index;
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asSeparatorFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter
    implements GFullSourceFragment_filters {
  @override
  String get G__typename;
  String get type;
  String get name;
  BuiltList<GFullSourceFragment_filters__asGroupFilter_filters> get filters;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters {
  String get G__typename;
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__base
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asCheckBoxFilter
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  String get type;
  bool get CheckBoxFilterDefault;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asHeaderFilter
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  String get type;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asSelectFilter
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  String get type;
  int get SelectFilterDefault;
  String get name;
  BuiltList<String> get Gvalues;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asTriStateFilter
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  String get type;
  _i1.GTriState get TriStateFilterDefault;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asTextFilter
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  String get type;
  String get TextFilterDefault;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asSortFilter
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  String get type;
  GFullSourceFragment_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault?
      get SortFilterDefault;
  String get name;
  BuiltList<String> get Gvalues;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault {
  String get G__typename;
  bool get ascending;
  int get index;
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragment_filters__asGroupFilter_filters__asSeparatorFilter
    implements GFullSourceFragment_filters__asGroupFilter_filters {
  @override
  String get G__typename;
  String get type;
  String get name;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullSourceFragmentData
    implements
        Built<GFullSourceFragmentData, GFullSourceFragmentDataBuilder>,
        GFullSourceFragment,
        GSourceFragment {
  GFullSourceFragmentData._();

  factory GFullSourceFragmentData(
          [void Function(GFullSourceFragmentDataBuilder b) updates]) =
      _$GFullSourceFragmentData;

  static void _initializeBuilder(GFullSourceFragmentDataBuilder b) =>
      b..G__typename = 'SourceType';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get iconUrl;
  @override
  _i1.GLongString get id;
  @override
  bool get isConfigurable;
  @override
  bool get isNsfw;
  @override
  String get lang;
  @override
  String get name;
  @override
  bool get supportsLatest;
  @override
  GFullSourceFragmentData_extension get extension;
  @override
  BuiltList<GFullSourceFragmentData_filters> get filters;
  static Serializer<GFullSourceFragmentData> get serializer =>
      _$gFullSourceFragmentDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_extension
    implements
        Built<GFullSourceFragmentData_extension,
            GFullSourceFragmentData_extensionBuilder>,
        GFullSourceFragment_extension,
        GSourceFragment_extension {
  GFullSourceFragmentData_extension._();

  factory GFullSourceFragmentData_extension(
          [void Function(GFullSourceFragmentData_extensionBuilder b) updates]) =
      _$GFullSourceFragmentData_extension;

  static void _initializeBuilder(GFullSourceFragmentData_extensionBuilder b) =>
      b..G__typename = 'ExtensionType';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get pkgName;
  @override
  String? get repo;
  static Serializer<GFullSourceFragmentData_extension> get serializer =>
      _$gFullSourceFragmentDataExtensionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_extension.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_extension? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_extension.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters
    implements GFullSourceFragment_filters {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GFullSourceFragmentData_filters> get serializer =>
      _i3.InlineFragmentSerializer<GFullSourceFragmentData_filters>(
        'GFullSourceFragmentData_filters',
        GFullSourceFragmentData_filters__base,
        {
          'CheckBoxFilter': GFullSourceFragmentData_filters__asCheckBoxFilter,
          'HeaderFilter': GFullSourceFragmentData_filters__asHeaderFilter,
          'SelectFilter': GFullSourceFragmentData_filters__asSelectFilter,
          'TriStateFilter': GFullSourceFragmentData_filters__asTriStateFilter,
          'TextFilter': GFullSourceFragmentData_filters__asTextFilter,
          'SortFilter': GFullSourceFragmentData_filters__asSortFilter,
          'SeparatorFilter': GFullSourceFragmentData_filters__asSeparatorFilter,
          'GroupFilter': GFullSourceFragmentData_filters__asGroupFilter,
        },
      );

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__base
    implements
        Built<GFullSourceFragmentData_filters__base,
            GFullSourceFragmentData_filters__baseBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__base._();

  factory GFullSourceFragmentData_filters__base(
      [void Function(GFullSourceFragmentData_filters__baseBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__base;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__baseBuilder b) =>
      b..G__typename = 'Filter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GFullSourceFragmentData_filters__base> get serializer =>
      _$gFullSourceFragmentDataFiltersBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__base? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__base.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asCheckBoxFilter
    implements
        Built<GFullSourceFragmentData_filters__asCheckBoxFilter,
            GFullSourceFragmentData_filters__asCheckBoxFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asCheckBoxFilter._();

  factory GFullSourceFragmentData_filters__asCheckBoxFilter(
      [void Function(GFullSourceFragmentData_filters__asCheckBoxFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asCheckBoxFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asCheckBoxFilterBuilder b) =>
      b..G__typename = 'CheckBoxFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  bool get CheckBoxFilterDefault;
  String get name;
  static Serializer<GFullSourceFragmentData_filters__asCheckBoxFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsCheckBoxFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asCheckBoxFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asCheckBoxFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asCheckBoxFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asHeaderFilter
    implements
        Built<GFullSourceFragmentData_filters__asHeaderFilter,
            GFullSourceFragmentData_filters__asHeaderFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asHeaderFilter._();

  factory GFullSourceFragmentData_filters__asHeaderFilter(
      [void Function(GFullSourceFragmentData_filters__asHeaderFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asHeaderFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asHeaderFilterBuilder b) =>
      b..G__typename = 'HeaderFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  String get name;
  static Serializer<GFullSourceFragmentData_filters__asHeaderFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsHeaderFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asHeaderFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asHeaderFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asHeaderFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asSelectFilter
    implements
        Built<GFullSourceFragmentData_filters__asSelectFilter,
            GFullSourceFragmentData_filters__asSelectFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asSelectFilter._();

  factory GFullSourceFragmentData_filters__asSelectFilter(
      [void Function(GFullSourceFragmentData_filters__asSelectFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asSelectFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asSelectFilterBuilder b) =>
      b..G__typename = 'SelectFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  int get SelectFilterDefault;
  String get name;
  @BuiltValueField(wireName: 'values')
  BuiltList<String> get Gvalues;
  static Serializer<GFullSourceFragmentData_filters__asSelectFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsSelectFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asSelectFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asSelectFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asSelectFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asTriStateFilter
    implements
        Built<GFullSourceFragmentData_filters__asTriStateFilter,
            GFullSourceFragmentData_filters__asTriStateFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asTriStateFilter._();

  factory GFullSourceFragmentData_filters__asTriStateFilter(
      [void Function(GFullSourceFragmentData_filters__asTriStateFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asTriStateFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asTriStateFilterBuilder b) =>
      b..G__typename = 'TriStateFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  _i1.GTriState get TriStateFilterDefault;
  String get name;
  static Serializer<GFullSourceFragmentData_filters__asTriStateFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsTriStateFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asTriStateFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asTriStateFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asTriStateFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asTextFilter
    implements
        Built<GFullSourceFragmentData_filters__asTextFilter,
            GFullSourceFragmentData_filters__asTextFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asTextFilter._();

  factory GFullSourceFragmentData_filters__asTextFilter(
      [void Function(GFullSourceFragmentData_filters__asTextFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asTextFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asTextFilterBuilder b) =>
      b..G__typename = 'TextFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  String get TextFilterDefault;
  String get name;
  static Serializer<GFullSourceFragmentData_filters__asTextFilter>
      get serializer => _$gFullSourceFragmentDataFiltersAsTextFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asTextFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asTextFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asTextFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asSortFilter
    implements
        Built<GFullSourceFragmentData_filters__asSortFilter,
            GFullSourceFragmentData_filters__asSortFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asSortFilter._();

  factory GFullSourceFragmentData_filters__asSortFilter(
      [void Function(GFullSourceFragmentData_filters__asSortFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asSortFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asSortFilterBuilder b) =>
      b..G__typename = 'SortFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault?
      get SortFilterDefault;
  String get name;
  @BuiltValueField(wireName: 'values')
  BuiltList<String> get Gvalues;
  static Serializer<GFullSourceFragmentData_filters__asSortFilter>
      get serializer => _$gFullSourceFragmentDataFiltersAsSortFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asSortFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asSortFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asSortFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault
    implements
        Built<GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault,
            GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder> {
  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault._();

  factory GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault(
          [void Function(
                  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder
              b) =>
      b..G__typename = 'SortSelection';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get ascending;
  int get index;
  static Serializer<
          GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsSortFilterSortFilterDefaultSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asSeparatorFilter
    implements
        Built<GFullSourceFragmentData_filters__asSeparatorFilter,
            GFullSourceFragmentData_filters__asSeparatorFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asSeparatorFilter._();

  factory GFullSourceFragmentData_filters__asSeparatorFilter(
      [void Function(
              GFullSourceFragmentData_filters__asSeparatorFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asSeparatorFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asSeparatorFilterBuilder b) =>
      b..G__typename = 'SeparatorFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  String get name;
  static Serializer<GFullSourceFragmentData_filters__asSeparatorFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsSeparatorFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asSeparatorFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asSeparatorFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asSeparatorFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter
    implements
        Built<GFullSourceFragmentData_filters__asGroupFilter,
            GFullSourceFragmentData_filters__asGroupFilterBuilder>,
        GFullSourceFragmentData_filters {
  GFullSourceFragmentData_filters__asGroupFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter(
      [void Function(GFullSourceFragmentData_filters__asGroupFilterBuilder b)
          updates]) = _$GFullSourceFragmentData_filters__asGroupFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilterBuilder b) =>
      b..G__typename = 'GroupFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  String get name;
  BuiltList<GFullSourceFragmentData_filters__asGroupFilter_filters> get filters;
  static Serializer<GFullSourceFragmentData_filters__asGroupFilter>
      get serializer => _$gFullSourceFragmentDataFiltersAsGroupFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asGroupFilter.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GFullSourceFragmentData_filters__asGroupFilter_filters>
      get serializer => _i3.InlineFragmentSerializer<
              GFullSourceFragmentData_filters__asGroupFilter_filters>(
            'GFullSourceFragmentData_filters__asGroupFilter_filters',
            GFullSourceFragmentData_filters__asGroupFilter_filters__base,
            {
              'CheckBoxFilter':
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter,
              'HeaderFilter':
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter,
              'SelectFilter':
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter,
              'TriStateFilter':
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter,
              'TextFilter':
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter,
              'SortFilter':
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter,
              'SeparatorFilter':
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter,
            },
          );

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__base
    implements
        Built<GFullSourceFragmentData_filters__asGroupFilter_filters__base,
            GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__base._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__base(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__base;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder
              b) =>
      b..G__typename = 'Filter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__base>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__base? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__base.serializer,
        json,
      );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder
              b) =>
      b..G__typename = 'CheckBoxFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  bool get CheckBoxFilterDefault;
  String get name;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsCheckBoxFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder
              b) =>
      b..G__typename = 'HeaderFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  String get name;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsHeaderFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder
              b) =>
      b..G__typename = 'SelectFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  int get SelectFilterDefault;
  String get name;
  @BuiltValueField(wireName: 'values')
  BuiltList<String> get Gvalues;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSelectFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder
              b) =>
      b..G__typename = 'TriStateFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  _i1.GTriState get TriStateFilterDefault;
  String get name;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsTriStateFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder
              b) =>
      b..G__typename = 'TextFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  String get TextFilterDefault;
  String get name;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsTextFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder
              b) =>
      b..G__typename = 'SortFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault?
      get SortFilterDefault;
  String get name;
  @BuiltValueField(wireName: 'values')
  BuiltList<String> get Gvalues;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSortFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder> {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder
              b) =>
      b..G__typename = 'SortSelection';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get ascending;
  int get index;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSortFilterSortFilterDefaultSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
                .serializer,
            json,
          );
}

abstract class GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
    implements
        Built<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder>,
        GFullSourceFragmentData_filters__asGroupFilter_filters {
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter._();

  factory GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder
                      b)
              updates]) =
      _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter;

  static void _initializeBuilder(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder
              b) =>
      b..G__typename = 'SeparatorFilter';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get type;
  String get name;
  static Serializer<
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter>
      get serializer =>
          _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSeparatorFilterSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter?
      fromJson(Map<String, dynamic> json) => _i2.serializers.deserializeWith(
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
                .serializer,
            json,
          );
}
