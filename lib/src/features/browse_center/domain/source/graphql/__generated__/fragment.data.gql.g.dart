// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSourceFragmentData> _$gSourceFragmentDataSerializer =
    new _$GSourceFragmentDataSerializer();
Serializer<GSourceFragmentData_extension>
    _$gSourceFragmentDataExtensionSerializer =
    new _$GSourceFragmentData_extensionSerializer();
Serializer<GFullSourceFragmentData> _$gFullSourceFragmentDataSerializer =
    new _$GFullSourceFragmentDataSerializer();
Serializer<GFullSourceFragmentData_extension>
    _$gFullSourceFragmentDataExtensionSerializer =
    new _$GFullSourceFragmentData_extensionSerializer();
Serializer<GFullSourceFragmentData_filters__base>
    _$gFullSourceFragmentDataFiltersBaseSerializer =
    new _$GFullSourceFragmentData_filters__baseSerializer();
Serializer<GFullSourceFragmentData_filters__asCheckBoxFilter>
    _$gFullSourceFragmentDataFiltersAsCheckBoxFilterSerializer =
    new _$GFullSourceFragmentData_filters__asCheckBoxFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asHeaderFilter>
    _$gFullSourceFragmentDataFiltersAsHeaderFilterSerializer =
    new _$GFullSourceFragmentData_filters__asHeaderFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asSelectFilter>
    _$gFullSourceFragmentDataFiltersAsSelectFilterSerializer =
    new _$GFullSourceFragmentData_filters__asSelectFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asTriStateFilter>
    _$gFullSourceFragmentDataFiltersAsTriStateFilterSerializer =
    new _$GFullSourceFragmentData_filters__asTriStateFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asTextFilter>
    _$gFullSourceFragmentDataFiltersAsTextFilterSerializer =
    new _$GFullSourceFragmentData_filters__asTextFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asSortFilter>
    _$gFullSourceFragmentDataFiltersAsSortFilterSerializer =
    new _$GFullSourceFragmentData_filters__asSortFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault>
    _$gFullSourceFragmentDataFiltersAsSortFilterSortFilterDefaultSerializer =
    new _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultSerializer();
Serializer<GFullSourceFragmentData_filters__asSeparatorFilter>
    _$gFullSourceFragmentDataFiltersAsSeparatorFilterSerializer =
    new _$GFullSourceFragmentData_filters__asSeparatorFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asGroupFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asGroupFilter_filters__base>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersBaseSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__baseSerializer();
Serializer<
        GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsCheckBoxFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterSerializer();
Serializer<
        GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsHeaderFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterSerializer();
Serializer<
        GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSelectFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterSerializer();
Serializer<
        GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsTriStateFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsTextFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterSerializer();
Serializer<GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSortFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterSerializer();
Serializer<
        GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSortFilterSortFilterDefaultSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultSerializer();
Serializer<
        GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter>
    _$gFullSourceFragmentDataFiltersAsGroupFilterFiltersAsSeparatorFilterSerializer =
    new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterSerializer();

class _$GSourceFragmentDataSerializer
    implements StructuredSerializer<GSourceFragmentData> {
  @override
  final Iterable<Type> types = const [
    GSourceFragmentData,
    _$GSourceFragmentData
  ];
  @override
  final String wireName = 'GSourceFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSourceFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'iconUrl',
      serializers.serialize(object.iconUrl,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(_i1.GLongString)),
      'isConfigurable',
      serializers.serialize(object.isConfigurable,
          specifiedType: const FullType(bool)),
      'isNsfw',
      serializers.serialize(object.isNsfw, specifiedType: const FullType(bool)),
      'lang',
      serializers.serialize(object.lang, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'supportsLatest',
      serializers.serialize(object.supportsLatest,
          specifiedType: const FullType(bool)),
      'extension',
      serializers.serialize(object.extension,
          specifiedType: const FullType(GSourceFragmentData_extension)),
    ];

    return result;
  }

  @override
  GSourceFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSourceFragmentDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GLongString))!
              as _i1.GLongString);
          break;
        case 'isConfigurable':
          result.isConfigurable = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isNsfw':
          result.isNsfw = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'lang':
          result.lang = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'supportsLatest':
          result.supportsLatest = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'extension':
          result.extension.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GSourceFragmentData_extension))!
              as GSourceFragmentData_extension);
          break;
      }
    }

    return result.build();
  }
}

class _$GSourceFragmentData_extensionSerializer
    implements StructuredSerializer<GSourceFragmentData_extension> {
  @override
  final Iterable<Type> types = const [
    GSourceFragmentData_extension,
    _$GSourceFragmentData_extension
  ];
  @override
  final String wireName = 'GSourceFragmentData_extension';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSourceFragmentData_extension object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pkgName',
      serializers.serialize(object.pkgName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.repo;
    if (value != null) {
      result
        ..add('repo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSourceFragmentData_extension deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSourceFragmentData_extensionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pkgName':
          result.pkgName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'repo':
          result.repo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentDataSerializer
    implements StructuredSerializer<GFullSourceFragmentData> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData,
    _$GFullSourceFragmentData
  ];
  @override
  final String wireName = 'GFullSourceFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullSourceFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'iconUrl',
      serializers.serialize(object.iconUrl,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(_i1.GLongString)),
      'isConfigurable',
      serializers.serialize(object.isConfigurable,
          specifiedType: const FullType(bool)),
      'isNsfw',
      serializers.serialize(object.isNsfw, specifiedType: const FullType(bool)),
      'lang',
      serializers.serialize(object.lang, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'supportsLatest',
      serializers.serialize(object.supportsLatest,
          specifiedType: const FullType(bool)),
      'extension',
      serializers.serialize(object.extension,
          specifiedType: const FullType(GFullSourceFragmentData_extension)),
      'filters',
      serializers.serialize(object.filters,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GFullSourceFragmentData_filters)])),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GLongString))!
              as _i1.GLongString);
          break;
        case 'isConfigurable':
          result.isConfigurable = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isNsfw':
          result.isNsfw = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'lang':
          result.lang = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'supportsLatest':
          result.supportsLatest = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'extension':
          result.extension.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFullSourceFragmentData_extension))!
              as GFullSourceFragmentData_extension);
          break;
        case 'filters':
          result.filters.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFullSourceFragmentData_filters)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_extensionSerializer
    implements StructuredSerializer<GFullSourceFragmentData_extension> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_extension,
    _$GFullSourceFragmentData_extension
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_extension';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullSourceFragmentData_extension object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pkgName',
      serializers.serialize(object.pkgName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.repo;
    if (value != null) {
      result
        ..add('repo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFullSourceFragmentData_extension deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentData_extensionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pkgName':
          result.pkgName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'repo':
          result.repo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__baseSerializer
    implements StructuredSerializer<GFullSourceFragmentData_filters__base> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__base,
    _$GFullSourceFragmentData_filters__base
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullSourceFragmentData_filters__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentData_filters__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asCheckBoxFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asCheckBoxFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asCheckBoxFilter,
    _$GFullSourceFragmentData_filters__asCheckBoxFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asCheckBoxFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asCheckBoxFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'CheckBoxFilterDefault',
      serializers.serialize(object.CheckBoxFilterDefault,
          specifiedType: const FullType(bool)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asCheckBoxFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asCheckBoxFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'CheckBoxFilterDefault':
          result.CheckBoxFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asHeaderFilterSerializer
    implements
        StructuredSerializer<GFullSourceFragmentData_filters__asHeaderFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asHeaderFilter,
    _$GFullSourceFragmentData_filters__asHeaderFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asHeaderFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asHeaderFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asHeaderFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentData_filters__asHeaderFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asSelectFilterSerializer
    implements
        StructuredSerializer<GFullSourceFragmentData_filters__asSelectFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asSelectFilter,
    _$GFullSourceFragmentData_filters__asSelectFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asSelectFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asSelectFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'SelectFilterDefault',
      serializers.serialize(object.SelectFilterDefault,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'values',
      serializers.serialize(object.Gvalues,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asSelectFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentData_filters__asSelectFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'SelectFilterDefault':
          result.SelectFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'values':
          result.Gvalues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asTriStateFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asTriStateFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asTriStateFilter,
    _$GFullSourceFragmentData_filters__asTriStateFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asTriStateFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asTriStateFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'TriStateFilterDefault',
      serializers.serialize(object.TriStateFilterDefault,
          specifiedType: const FullType(_i1.GTriState)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asTriStateFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asTriStateFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'TriStateFilterDefault':
          result.TriStateFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GTriState))! as _i1.GTriState;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asTextFilterSerializer
    implements
        StructuredSerializer<GFullSourceFragmentData_filters__asTextFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asTextFilter,
    _$GFullSourceFragmentData_filters__asTextFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asTextFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asTextFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'TextFilterDefault',
      serializers.serialize(object.TextFilterDefault,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asTextFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentData_filters__asTextFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'TextFilterDefault':
          result.TextFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asSortFilterSerializer
    implements
        StructuredSerializer<GFullSourceFragmentData_filters__asSortFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asSortFilter,
    _$GFullSourceFragmentData_filters__asSortFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asSortFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asSortFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'values',
      serializers.serialize(object.Gvalues,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.SortFilterDefault;
    if (value != null) {
      result
        ..add('SortFilterDefault')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault)));
    }
    return result;
  }

  @override
  GFullSourceFragmentData_filters__asSortFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentData_filters__asSortFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'SortFilterDefault':
          result.SortFilterDefault.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault))!
              as GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'values':
          result.Gvalues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault,
    _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'ascending',
      serializers.serialize(object.ascending,
          specifiedType: const FullType(bool)),
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ascending':
          result.ascending = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asSeparatorFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asSeparatorFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asSeparatorFilter,
    _$GFullSourceFragmentData_filters__asSeparatorFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asSeparatorFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asSeparatorFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asSeparatorFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asSeparatorFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilterSerializer
    implements
        StructuredSerializer<GFullSourceFragmentData_filters__asGroupFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter
  ];
  @override
  final String wireName = 'GFullSourceFragmentData_filters__asGroupFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'filters',
      serializers.serialize(object.filters,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GFullSourceFragmentData_filters__asGroupFilter_filters)
          ])),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullSourceFragmentData_filters__asGroupFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'filters':
          result.filters.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GFullSourceFragmentData_filters__asGroupFilter_filters)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__baseSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__base> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__base,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__base
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'CheckBoxFilterDefault',
      serializers.serialize(object.CheckBoxFilterDefault,
          specifiedType: const FullType(bool)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'CheckBoxFilterDefault':
          result.CheckBoxFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'SelectFilterDefault',
      serializers.serialize(object.SelectFilterDefault,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'values',
      serializers.serialize(object.Gvalues,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'SelectFilterDefault':
          result.SelectFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'values':
          result.Gvalues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'TriStateFilterDefault',
      serializers.serialize(object.TriStateFilterDefault,
          specifiedType: const FullType(_i1.GTriState)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'TriStateFilterDefault':
          result.TriStateFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GTriState))! as _i1.GTriState;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'TextFilterDefault',
      serializers.serialize(object.TextFilterDefault,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'TextFilterDefault':
          result.TextFilterDefault = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'values',
      serializers.serialize(object.Gvalues,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.SortFilterDefault;
    if (value != null) {
      result
        ..add('SortFilterDefault')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault)));
    }
    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'SortFilterDefault':
          result.SortFilterDefault.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault))!
              as GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'values':
          result.Gvalues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'ascending',
      serializers.serialize(object.ascending,
          specifiedType: const FullType(bool)),
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ascending':
          result.ascending = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterSerializer
    implements
        StructuredSerializer<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter> {
  @override
  final Iterable<Type> types = const [
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter,
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
  ];
  @override
  final String wireName =
      'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GSourceFragmentData extends GSourceFragmentData {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String iconUrl;
  @override
  final _i1.GLongString id;
  @override
  final bool isConfigurable;
  @override
  final bool isNsfw;
  @override
  final String lang;
  @override
  final String name;
  @override
  final bool supportsLatest;
  @override
  final GSourceFragmentData_extension extension;

  factory _$GSourceFragmentData(
          [void Function(GSourceFragmentDataBuilder)? updates]) =>
      (new GSourceFragmentDataBuilder()..update(updates))._build();

  _$GSourceFragmentData._(
      {required this.G__typename,
      required this.displayName,
      required this.iconUrl,
      required this.id,
      required this.isConfigurable,
      required this.isNsfw,
      required this.lang,
      required this.name,
      required this.supportsLatest,
      required this.extension})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSourceFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'GSourceFragmentData', 'displayName');
    BuiltValueNullFieldError.checkNotNull(
        iconUrl, r'GSourceFragmentData', 'iconUrl');
    BuiltValueNullFieldError.checkNotNull(id, r'GSourceFragmentData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isConfigurable, r'GSourceFragmentData', 'isConfigurable');
    BuiltValueNullFieldError.checkNotNull(
        isNsfw, r'GSourceFragmentData', 'isNsfw');
    BuiltValueNullFieldError.checkNotNull(lang, r'GSourceFragmentData', 'lang');
    BuiltValueNullFieldError.checkNotNull(name, r'GSourceFragmentData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        supportsLatest, r'GSourceFragmentData', 'supportsLatest');
    BuiltValueNullFieldError.checkNotNull(
        extension, r'GSourceFragmentData', 'extension');
  }

  @override
  GSourceFragmentData rebuild(
          void Function(GSourceFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSourceFragmentDataBuilder toBuilder() =>
      new GSourceFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSourceFragmentData &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        iconUrl == other.iconUrl &&
        id == other.id &&
        isConfigurable == other.isConfigurable &&
        isNsfw == other.isNsfw &&
        lang == other.lang &&
        name == other.name &&
        supportsLatest == other.supportsLatest &&
        extension == other.extension;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isConfigurable.hashCode);
    _$hash = $jc(_$hash, isNsfw.hashCode);
    _$hash = $jc(_$hash, lang.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, supportsLatest.hashCode);
    _$hash = $jc(_$hash, extension.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSourceFragmentData')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('iconUrl', iconUrl)
          ..add('id', id)
          ..add('isConfigurable', isConfigurable)
          ..add('isNsfw', isNsfw)
          ..add('lang', lang)
          ..add('name', name)
          ..add('supportsLatest', supportsLatest)
          ..add('extension', extension))
        .toString();
  }
}

class GSourceFragmentDataBuilder
    implements Builder<GSourceFragmentData, GSourceFragmentDataBuilder> {
  _$GSourceFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  _i1.GLongStringBuilder? _id;
  _i1.GLongStringBuilder get id => _$this._id ??= new _i1.GLongStringBuilder();
  set id(_i1.GLongStringBuilder? id) => _$this._id = id;

  bool? _isConfigurable;
  bool? get isConfigurable => _$this._isConfigurable;
  set isConfigurable(bool? isConfigurable) =>
      _$this._isConfigurable = isConfigurable;

  bool? _isNsfw;
  bool? get isNsfw => _$this._isNsfw;
  set isNsfw(bool? isNsfw) => _$this._isNsfw = isNsfw;

  String? _lang;
  String? get lang => _$this._lang;
  set lang(String? lang) => _$this._lang = lang;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _supportsLatest;
  bool? get supportsLatest => _$this._supportsLatest;
  set supportsLatest(bool? supportsLatest) =>
      _$this._supportsLatest = supportsLatest;

  GSourceFragmentData_extensionBuilder? _extension;
  GSourceFragmentData_extensionBuilder get extension =>
      _$this._extension ??= new GSourceFragmentData_extensionBuilder();
  set extension(GSourceFragmentData_extensionBuilder? extension) =>
      _$this._extension = extension;

  GSourceFragmentDataBuilder() {
    GSourceFragmentData._initializeBuilder(this);
  }

  GSourceFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _iconUrl = $v.iconUrl;
      _id = $v.id.toBuilder();
      _isConfigurable = $v.isConfigurable;
      _isNsfw = $v.isNsfw;
      _lang = $v.lang;
      _name = $v.name;
      _supportsLatest = $v.supportsLatest;
      _extension = $v.extension.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSourceFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSourceFragmentData;
  }

  @override
  void update(void Function(GSourceFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSourceFragmentData build() => _build();

  _$GSourceFragmentData _build() {
    _$GSourceFragmentData _$result;
    try {
      _$result = _$v ??
          new _$GSourceFragmentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSourceFragmentData', 'G__typename'),
              displayName: BuiltValueNullFieldError.checkNotNull(
                  displayName, r'GSourceFragmentData', 'displayName'),
              iconUrl: BuiltValueNullFieldError.checkNotNull(
                  iconUrl, r'GSourceFragmentData', 'iconUrl'),
              id: id.build(),
              isConfigurable: BuiltValueNullFieldError.checkNotNull(
                  isConfigurable, r'GSourceFragmentData', 'isConfigurable'),
              isNsfw: BuiltValueNullFieldError.checkNotNull(
                  isNsfw, r'GSourceFragmentData', 'isNsfw'),
              lang: BuiltValueNullFieldError.checkNotNull(
                  lang, r'GSourceFragmentData', 'lang'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GSourceFragmentData', 'name'),
              supportsLatest: BuiltValueNullFieldError.checkNotNull(
                  supportsLatest, r'GSourceFragmentData', 'supportsLatest'),
              extension: extension.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'id';
        id.build();

        _$failedField = 'extension';
        extension.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSourceFragmentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSourceFragmentData_extension extends GSourceFragmentData_extension {
  @override
  final String G__typename;
  @override
  final String pkgName;
  @override
  final String? repo;

  factory _$GSourceFragmentData_extension(
          [void Function(GSourceFragmentData_extensionBuilder)? updates]) =>
      (new GSourceFragmentData_extensionBuilder()..update(updates))._build();

  _$GSourceFragmentData_extension._(
      {required this.G__typename, required this.pkgName, this.repo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSourceFragmentData_extension', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pkgName, r'GSourceFragmentData_extension', 'pkgName');
  }

  @override
  GSourceFragmentData_extension rebuild(
          void Function(GSourceFragmentData_extensionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSourceFragmentData_extensionBuilder toBuilder() =>
      new GSourceFragmentData_extensionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSourceFragmentData_extension &&
        G__typename == other.G__typename &&
        pkgName == other.pkgName &&
        repo == other.repo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, pkgName.hashCode);
    _$hash = $jc(_$hash, repo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSourceFragmentData_extension')
          ..add('G__typename', G__typename)
          ..add('pkgName', pkgName)
          ..add('repo', repo))
        .toString();
  }
}

class GSourceFragmentData_extensionBuilder
    implements
        Builder<GSourceFragmentData_extension,
            GSourceFragmentData_extensionBuilder> {
  _$GSourceFragmentData_extension? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _pkgName;
  String? get pkgName => _$this._pkgName;
  set pkgName(String? pkgName) => _$this._pkgName = pkgName;

  String? _repo;
  String? get repo => _$this._repo;
  set repo(String? repo) => _$this._repo = repo;

  GSourceFragmentData_extensionBuilder() {
    GSourceFragmentData_extension._initializeBuilder(this);
  }

  GSourceFragmentData_extensionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pkgName = $v.pkgName;
      _repo = $v.repo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSourceFragmentData_extension other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSourceFragmentData_extension;
  }

  @override
  void update(void Function(GSourceFragmentData_extensionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSourceFragmentData_extension build() => _build();

  _$GSourceFragmentData_extension _build() {
    final _$result = _$v ??
        new _$GSourceFragmentData_extension._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSourceFragmentData_extension', 'G__typename'),
            pkgName: BuiltValueNullFieldError.checkNotNull(
                pkgName, r'GSourceFragmentData_extension', 'pkgName'),
            repo: repo);
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData extends GFullSourceFragmentData {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String iconUrl;
  @override
  final _i1.GLongString id;
  @override
  final bool isConfigurable;
  @override
  final bool isNsfw;
  @override
  final String lang;
  @override
  final String name;
  @override
  final bool supportsLatest;
  @override
  final GFullSourceFragmentData_extension extension;
  @override
  final BuiltList<GFullSourceFragmentData_filters> filters;

  factory _$GFullSourceFragmentData(
          [void Function(GFullSourceFragmentDataBuilder)? updates]) =>
      (new GFullSourceFragmentDataBuilder()..update(updates))._build();

  _$GFullSourceFragmentData._(
      {required this.G__typename,
      required this.displayName,
      required this.iconUrl,
      required this.id,
      required this.isConfigurable,
      required this.isNsfw,
      required this.lang,
      required this.name,
      required this.supportsLatest,
      required this.extension,
      required this.filters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullSourceFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'GFullSourceFragmentData', 'displayName');
    BuiltValueNullFieldError.checkNotNull(
        iconUrl, r'GFullSourceFragmentData', 'iconUrl');
    BuiltValueNullFieldError.checkNotNull(id, r'GFullSourceFragmentData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isConfigurable, r'GFullSourceFragmentData', 'isConfigurable');
    BuiltValueNullFieldError.checkNotNull(
        isNsfw, r'GFullSourceFragmentData', 'isNsfw');
    BuiltValueNullFieldError.checkNotNull(
        lang, r'GFullSourceFragmentData', 'lang');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        supportsLatest, r'GFullSourceFragmentData', 'supportsLatest');
    BuiltValueNullFieldError.checkNotNull(
        extension, r'GFullSourceFragmentData', 'extension');
    BuiltValueNullFieldError.checkNotNull(
        filters, r'GFullSourceFragmentData', 'filters');
  }

  @override
  GFullSourceFragmentData rebuild(
          void Function(GFullSourceFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentDataBuilder toBuilder() =>
      new GFullSourceFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        iconUrl == other.iconUrl &&
        id == other.id &&
        isConfigurable == other.isConfigurable &&
        isNsfw == other.isNsfw &&
        lang == other.lang &&
        name == other.name &&
        supportsLatest == other.supportsLatest &&
        extension == other.extension &&
        filters == other.filters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isConfigurable.hashCode);
    _$hash = $jc(_$hash, isNsfw.hashCode);
    _$hash = $jc(_$hash, lang.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, supportsLatest.hashCode);
    _$hash = $jc(_$hash, extension.hashCode);
    _$hash = $jc(_$hash, filters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFullSourceFragmentData')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('iconUrl', iconUrl)
          ..add('id', id)
          ..add('isConfigurable', isConfigurable)
          ..add('isNsfw', isNsfw)
          ..add('lang', lang)
          ..add('name', name)
          ..add('supportsLatest', supportsLatest)
          ..add('extension', extension)
          ..add('filters', filters))
        .toString();
  }
}

class GFullSourceFragmentDataBuilder
    implements
        Builder<GFullSourceFragmentData, GFullSourceFragmentDataBuilder> {
  _$GFullSourceFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  _i1.GLongStringBuilder? _id;
  _i1.GLongStringBuilder get id => _$this._id ??= new _i1.GLongStringBuilder();
  set id(_i1.GLongStringBuilder? id) => _$this._id = id;

  bool? _isConfigurable;
  bool? get isConfigurable => _$this._isConfigurable;
  set isConfigurable(bool? isConfigurable) =>
      _$this._isConfigurable = isConfigurable;

  bool? _isNsfw;
  bool? get isNsfw => _$this._isNsfw;
  set isNsfw(bool? isNsfw) => _$this._isNsfw = isNsfw;

  String? _lang;
  String? get lang => _$this._lang;
  set lang(String? lang) => _$this._lang = lang;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _supportsLatest;
  bool? get supportsLatest => _$this._supportsLatest;
  set supportsLatest(bool? supportsLatest) =>
      _$this._supportsLatest = supportsLatest;

  GFullSourceFragmentData_extensionBuilder? _extension;
  GFullSourceFragmentData_extensionBuilder get extension =>
      _$this._extension ??= new GFullSourceFragmentData_extensionBuilder();
  set extension(GFullSourceFragmentData_extensionBuilder? extension) =>
      _$this._extension = extension;

  ListBuilder<GFullSourceFragmentData_filters>? _filters;
  ListBuilder<GFullSourceFragmentData_filters> get filters =>
      _$this._filters ??= new ListBuilder<GFullSourceFragmentData_filters>();
  set filters(ListBuilder<GFullSourceFragmentData_filters>? filters) =>
      _$this._filters = filters;

  GFullSourceFragmentDataBuilder() {
    GFullSourceFragmentData._initializeBuilder(this);
  }

  GFullSourceFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _iconUrl = $v.iconUrl;
      _id = $v.id.toBuilder();
      _isConfigurable = $v.isConfigurable;
      _isNsfw = $v.isNsfw;
      _lang = $v.lang;
      _name = $v.name;
      _supportsLatest = $v.supportsLatest;
      _extension = $v.extension.toBuilder();
      _filters = $v.filters.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData;
  }

  @override
  void update(void Function(GFullSourceFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData build() => _build();

  _$GFullSourceFragmentData _build() {
    _$GFullSourceFragmentData _$result;
    try {
      _$result = _$v ??
          new _$GFullSourceFragmentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFullSourceFragmentData', 'G__typename'),
              displayName: BuiltValueNullFieldError.checkNotNull(
                  displayName, r'GFullSourceFragmentData', 'displayName'),
              iconUrl: BuiltValueNullFieldError.checkNotNull(
                  iconUrl, r'GFullSourceFragmentData', 'iconUrl'),
              id: id.build(),
              isConfigurable: BuiltValueNullFieldError.checkNotNull(
                  isConfigurable, r'GFullSourceFragmentData', 'isConfigurable'),
              isNsfw: BuiltValueNullFieldError.checkNotNull(
                  isNsfw, r'GFullSourceFragmentData', 'isNsfw'),
              lang: BuiltValueNullFieldError.checkNotNull(
                  lang, r'GFullSourceFragmentData', 'lang'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GFullSourceFragmentData', 'name'),
              supportsLatest: BuiltValueNullFieldError.checkNotNull(
                  supportsLatest, r'GFullSourceFragmentData', 'supportsLatest'),
              extension: extension.build(),
              filters: filters.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'id';
        id.build();

        _$failedField = 'extension';
        extension.build();
        _$failedField = 'filters';
        filters.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullSourceFragmentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_extension
    extends GFullSourceFragmentData_extension {
  @override
  final String G__typename;
  @override
  final String pkgName;
  @override
  final String? repo;

  factory _$GFullSourceFragmentData_extension(
          [void Function(GFullSourceFragmentData_extensionBuilder)? updates]) =>
      (new GFullSourceFragmentData_extensionBuilder()..update(updates))
          ._build();

  _$GFullSourceFragmentData_extension._(
      {required this.G__typename, required this.pkgName, this.repo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullSourceFragmentData_extension', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pkgName, r'GFullSourceFragmentData_extension', 'pkgName');
  }

  @override
  GFullSourceFragmentData_extension rebuild(
          void Function(GFullSourceFragmentData_extensionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_extensionBuilder toBuilder() =>
      new GFullSourceFragmentData_extensionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_extension &&
        G__typename == other.G__typename &&
        pkgName == other.pkgName &&
        repo == other.repo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, pkgName.hashCode);
    _$hash = $jc(_$hash, repo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFullSourceFragmentData_extension')
          ..add('G__typename', G__typename)
          ..add('pkgName', pkgName)
          ..add('repo', repo))
        .toString();
  }
}

class GFullSourceFragmentData_extensionBuilder
    implements
        Builder<GFullSourceFragmentData_extension,
            GFullSourceFragmentData_extensionBuilder> {
  _$GFullSourceFragmentData_extension? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _pkgName;
  String? get pkgName => _$this._pkgName;
  set pkgName(String? pkgName) => _$this._pkgName = pkgName;

  String? _repo;
  String? get repo => _$this._repo;
  set repo(String? repo) => _$this._repo = repo;

  GFullSourceFragmentData_extensionBuilder() {
    GFullSourceFragmentData_extension._initializeBuilder(this);
  }

  GFullSourceFragmentData_extensionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pkgName = $v.pkgName;
      _repo = $v.repo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_extension other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_extension;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_extensionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_extension build() => _build();

  _$GFullSourceFragmentData_extension _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_extension._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFullSourceFragmentData_extension', 'G__typename'),
            pkgName: BuiltValueNullFieldError.checkNotNull(
                pkgName, r'GFullSourceFragmentData_extension', 'pkgName'),
            repo: repo);
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__base
    extends GFullSourceFragmentData_filters__base {
  @override
  final String G__typename;

  factory _$GFullSourceFragmentData_filters__base(
          [void Function(GFullSourceFragmentData_filters__baseBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__baseBuilder()..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__base._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullSourceFragmentData_filters__base', 'G__typename');
  }

  @override
  GFullSourceFragmentData_filters__base rebuild(
          void Function(GFullSourceFragmentData_filters__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__baseBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GFullSourceFragmentData_filters__baseBuilder
    implements
        Builder<GFullSourceFragmentData_filters__base,
            GFullSourceFragmentData_filters__baseBuilder> {
  _$GFullSourceFragmentData_filters__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFullSourceFragmentData_filters__baseBuilder() {
    GFullSourceFragmentData_filters__base._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__base;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__base build() => _build();

  _$GFullSourceFragmentData_filters__base _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFullSourceFragmentData_filters__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asCheckBoxFilter
    extends GFullSourceFragmentData_filters__asCheckBoxFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final bool CheckBoxFilterDefault;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asCheckBoxFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asCheckBoxFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asCheckBoxFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asCheckBoxFilter._(
      {required this.G__typename,
      required this.type,
      required this.CheckBoxFilterDefault,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asCheckBoxFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asCheckBoxFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        CheckBoxFilterDefault,
        r'GFullSourceFragmentData_filters__asCheckBoxFilter',
        'CheckBoxFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asCheckBoxFilter', 'name');
  }

  @override
  GFullSourceFragmentData_filters__asCheckBoxFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asCheckBoxFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asCheckBoxFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asCheckBoxFilterBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asCheckBoxFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        CheckBoxFilterDefault == other.CheckBoxFilterDefault &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, CheckBoxFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asCheckBoxFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('CheckBoxFilterDefault', CheckBoxFilterDefault)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asCheckBoxFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asCheckBoxFilter,
            GFullSourceFragmentData_filters__asCheckBoxFilterBuilder> {
  _$GFullSourceFragmentData_filters__asCheckBoxFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _CheckBoxFilterDefault;
  bool? get CheckBoxFilterDefault => _$this._CheckBoxFilterDefault;
  set CheckBoxFilterDefault(bool? CheckBoxFilterDefault) =>
      _$this._CheckBoxFilterDefault = CheckBoxFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asCheckBoxFilterBuilder() {
    GFullSourceFragmentData_filters__asCheckBoxFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asCheckBoxFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _CheckBoxFilterDefault = $v.CheckBoxFilterDefault;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asCheckBoxFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asCheckBoxFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asCheckBoxFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asCheckBoxFilter build() => _build();

  _$GFullSourceFragmentData_filters__asCheckBoxFilter _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asCheckBoxFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asCheckBoxFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(type,
                r'GFullSourceFragmentData_filters__asCheckBoxFilter', 'type'),
            CheckBoxFilterDefault: BuiltValueNullFieldError.checkNotNull(
                CheckBoxFilterDefault,
                r'GFullSourceFragmentData_filters__asCheckBoxFilter',
                'CheckBoxFilterDefault'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GFullSourceFragmentData_filters__asCheckBoxFilter', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asHeaderFilter
    extends GFullSourceFragmentData_filters__asHeaderFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asHeaderFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asHeaderFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asHeaderFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asHeaderFilter._(
      {required this.G__typename, required this.type, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asHeaderFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asHeaderFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asHeaderFilter', 'name');
  }

  @override
  GFullSourceFragmentData_filters__asHeaderFilter rebuild(
          void Function(GFullSourceFragmentData_filters__asHeaderFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asHeaderFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asHeaderFilterBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asHeaderFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asHeaderFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asHeaderFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asHeaderFilter,
            GFullSourceFragmentData_filters__asHeaderFilterBuilder> {
  _$GFullSourceFragmentData_filters__asHeaderFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asHeaderFilterBuilder() {
    GFullSourceFragmentData_filters__asHeaderFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asHeaderFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asHeaderFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asHeaderFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asHeaderFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asHeaderFilter build() => _build();

  _$GFullSourceFragmentData_filters__asHeaderFilter _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asHeaderFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asHeaderFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(type,
                r'GFullSourceFragmentData_filters__asHeaderFilter', 'type'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GFullSourceFragmentData_filters__asHeaderFilter', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asSelectFilter
    extends GFullSourceFragmentData_filters__asSelectFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final int SelectFilterDefault;
  @override
  final String name;
  @override
  final BuiltList<String> Gvalues;

  factory _$GFullSourceFragmentData_filters__asSelectFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asSelectFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asSelectFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asSelectFilter._(
      {required this.G__typename,
      required this.type,
      required this.SelectFilterDefault,
      required this.name,
      required this.Gvalues})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asSelectFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asSelectFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        SelectFilterDefault,
        r'GFullSourceFragmentData_filters__asSelectFilter',
        'SelectFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asSelectFilter', 'name');
    BuiltValueNullFieldError.checkNotNull(
        Gvalues, r'GFullSourceFragmentData_filters__asSelectFilter', 'Gvalues');
  }

  @override
  GFullSourceFragmentData_filters__asSelectFilter rebuild(
          void Function(GFullSourceFragmentData_filters__asSelectFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asSelectFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asSelectFilterBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asSelectFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        SelectFilterDefault == other.SelectFilterDefault &&
        name == other.name &&
        Gvalues == other.Gvalues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, SelectFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, Gvalues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asSelectFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('SelectFilterDefault', SelectFilterDefault)
          ..add('name', name)
          ..add('Gvalues', Gvalues))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asSelectFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asSelectFilter,
            GFullSourceFragmentData_filters__asSelectFilterBuilder> {
  _$GFullSourceFragmentData_filters__asSelectFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _SelectFilterDefault;
  int? get SelectFilterDefault => _$this._SelectFilterDefault;
  set SelectFilterDefault(int? SelectFilterDefault) =>
      _$this._SelectFilterDefault = SelectFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _Gvalues;
  ListBuilder<String> get Gvalues =>
      _$this._Gvalues ??= new ListBuilder<String>();
  set Gvalues(ListBuilder<String>? Gvalues) => _$this._Gvalues = Gvalues;

  GFullSourceFragmentData_filters__asSelectFilterBuilder() {
    GFullSourceFragmentData_filters__asSelectFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asSelectFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _SelectFilterDefault = $v.SelectFilterDefault;
      _name = $v.name;
      _Gvalues = $v.Gvalues.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asSelectFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asSelectFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asSelectFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asSelectFilter build() => _build();

  _$GFullSourceFragmentData_filters__asSelectFilter _build() {
    _$GFullSourceFragmentData_filters__asSelectFilter _$result;
    try {
      _$result = _$v ??
          new _$GFullSourceFragmentData_filters__asSelectFilter._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GFullSourceFragmentData_filters__asSelectFilter',
                  'G__typename'),
              type: BuiltValueNullFieldError.checkNotNull(type,
                  r'GFullSourceFragmentData_filters__asSelectFilter', 'type'),
              SelectFilterDefault: BuiltValueNullFieldError.checkNotNull(
                  SelectFilterDefault,
                  r'GFullSourceFragmentData_filters__asSelectFilter',
                  'SelectFilterDefault'),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  r'GFullSourceFragmentData_filters__asSelectFilter', 'name'),
              Gvalues: Gvalues.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'Gvalues';
        Gvalues.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullSourceFragmentData_filters__asSelectFilter',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asTriStateFilter
    extends GFullSourceFragmentData_filters__asTriStateFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final _i1.GTriState TriStateFilterDefault;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asTriStateFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asTriStateFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asTriStateFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asTriStateFilter._(
      {required this.G__typename,
      required this.type,
      required this.TriStateFilterDefault,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asTriStateFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asTriStateFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        TriStateFilterDefault,
        r'GFullSourceFragmentData_filters__asTriStateFilter',
        'TriStateFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asTriStateFilter', 'name');
  }

  @override
  GFullSourceFragmentData_filters__asTriStateFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asTriStateFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asTriStateFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asTriStateFilterBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asTriStateFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        TriStateFilterDefault == other.TriStateFilterDefault &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, TriStateFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asTriStateFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('TriStateFilterDefault', TriStateFilterDefault)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asTriStateFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asTriStateFilter,
            GFullSourceFragmentData_filters__asTriStateFilterBuilder> {
  _$GFullSourceFragmentData_filters__asTriStateFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  _i1.GTriState? _TriStateFilterDefault;
  _i1.GTriState? get TriStateFilterDefault => _$this._TriStateFilterDefault;
  set TriStateFilterDefault(_i1.GTriState? TriStateFilterDefault) =>
      _$this._TriStateFilterDefault = TriStateFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asTriStateFilterBuilder() {
    GFullSourceFragmentData_filters__asTriStateFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asTriStateFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _TriStateFilterDefault = $v.TriStateFilterDefault;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asTriStateFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asTriStateFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asTriStateFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asTriStateFilter build() => _build();

  _$GFullSourceFragmentData_filters__asTriStateFilter _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asTriStateFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asTriStateFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(type,
                r'GFullSourceFragmentData_filters__asTriStateFilter', 'type'),
            TriStateFilterDefault: BuiltValueNullFieldError.checkNotNull(
                TriStateFilterDefault,
                r'GFullSourceFragmentData_filters__asTriStateFilter',
                'TriStateFilterDefault'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GFullSourceFragmentData_filters__asTriStateFilter', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asTextFilter
    extends GFullSourceFragmentData_filters__asTextFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final String TextFilterDefault;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asTextFilter(
          [void Function(GFullSourceFragmentData_filters__asTextFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asTextFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asTextFilter._(
      {required this.G__typename,
      required this.type,
      required this.TextFilterDefault,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asTextFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asTextFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(TextFilterDefault,
        r'GFullSourceFragmentData_filters__asTextFilter', 'TextFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asTextFilter', 'name');
  }

  @override
  GFullSourceFragmentData_filters__asTextFilter rebuild(
          void Function(GFullSourceFragmentData_filters__asTextFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asTextFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asTextFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asTextFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        TextFilterDefault == other.TextFilterDefault &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, TextFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asTextFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('TextFilterDefault', TextFilterDefault)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asTextFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asTextFilter,
            GFullSourceFragmentData_filters__asTextFilterBuilder> {
  _$GFullSourceFragmentData_filters__asTextFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _TextFilterDefault;
  String? get TextFilterDefault => _$this._TextFilterDefault;
  set TextFilterDefault(String? TextFilterDefault) =>
      _$this._TextFilterDefault = TextFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asTextFilterBuilder() {
    GFullSourceFragmentData_filters__asTextFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asTextFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _TextFilterDefault = $v.TextFilterDefault;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asTextFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asTextFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asTextFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asTextFilter build() => _build();

  _$GFullSourceFragmentData_filters__asTextFilter _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asTextFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asTextFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GFullSourceFragmentData_filters__asTextFilter', 'type'),
            TextFilterDefault: BuiltValueNullFieldError.checkNotNull(
                TextFilterDefault,
                r'GFullSourceFragmentData_filters__asTextFilter',
                'TextFilterDefault'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GFullSourceFragmentData_filters__asTextFilter', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asSortFilter
    extends GFullSourceFragmentData_filters__asSortFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault?
      SortFilterDefault;
  @override
  final String name;
  @override
  final BuiltList<String> Gvalues;

  factory _$GFullSourceFragmentData_filters__asSortFilter(
          [void Function(GFullSourceFragmentData_filters__asSortFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asSortFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asSortFilter._(
      {required this.G__typename,
      required this.type,
      this.SortFilterDefault,
      required this.name,
      required this.Gvalues})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asSortFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asSortFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asSortFilter', 'name');
    BuiltValueNullFieldError.checkNotNull(
        Gvalues, r'GFullSourceFragmentData_filters__asSortFilter', 'Gvalues');
  }

  @override
  GFullSourceFragmentData_filters__asSortFilter rebuild(
          void Function(GFullSourceFragmentData_filters__asSortFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asSortFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asSortFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asSortFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        SortFilterDefault == other.SortFilterDefault &&
        name == other.name &&
        Gvalues == other.Gvalues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, SortFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, Gvalues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asSortFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('SortFilterDefault', SortFilterDefault)
          ..add('name', name)
          ..add('Gvalues', Gvalues))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asSortFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asSortFilter,
            GFullSourceFragmentData_filters__asSortFilterBuilder> {
  _$GFullSourceFragmentData_filters__asSortFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder?
      _SortFilterDefault;
  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder
      get SortFilterDefault => _$this._SortFilterDefault ??=
          new GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder();
  set SortFilterDefault(
          GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder?
              SortFilterDefault) =>
      _$this._SortFilterDefault = SortFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _Gvalues;
  ListBuilder<String> get Gvalues =>
      _$this._Gvalues ??= new ListBuilder<String>();
  set Gvalues(ListBuilder<String>? Gvalues) => _$this._Gvalues = Gvalues;

  GFullSourceFragmentData_filters__asSortFilterBuilder() {
    GFullSourceFragmentData_filters__asSortFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asSortFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _SortFilterDefault = $v.SortFilterDefault?.toBuilder();
      _name = $v.name;
      _Gvalues = $v.Gvalues.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asSortFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asSortFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asSortFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asSortFilter build() => _build();

  _$GFullSourceFragmentData_filters__asSortFilter _build() {
    _$GFullSourceFragmentData_filters__asSortFilter _$result;
    try {
      _$result = _$v ??
          new _$GFullSourceFragmentData_filters__asSortFilter._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GFullSourceFragmentData_filters__asSortFilter',
                  'G__typename'),
              type: BuiltValueNullFieldError.checkNotNull(type,
                  r'GFullSourceFragmentData_filters__asSortFilter', 'type'),
              SortFilterDefault: _SortFilterDefault?.build(),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  r'GFullSourceFragmentData_filters__asSortFilter', 'name'),
              Gvalues: Gvalues.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'SortFilterDefault';
        _SortFilterDefault?.build();

        _$failedField = 'Gvalues';
        Gvalues.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullSourceFragmentData_filters__asSortFilter',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault
    extends GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault {
  @override
  final String G__typename;
  @override
  final bool ascending;
  @override
  final int index;

  factory _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault(
          [void Function(
                  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault._(
      {required this.G__typename, required this.ascending, required this.index})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        ascending,
        r'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault',
        'ascending');
    BuiltValueNullFieldError.checkNotNull(
        index,
        r'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault',
        'index');
  }

  @override
  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault &&
        G__typename == other.G__typename &&
        ascending == other.ascending &&
        index == other.index;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, ascending.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault')
          ..add('G__typename', G__typename)
          ..add('ascending', ascending)
          ..add('index', index))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault,
            GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder> {
  _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _ascending;
  bool? get ascending => _$this._ascending;
  set ascending(bool? ascending) => _$this._ascending = ascending;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder() {
    GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _ascending = $v.ascending;
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asSortFilter_SortFilterDefaultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault build() =>
      _build();

  _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault',
                'G__typename'),
            ascending: BuiltValueNullFieldError.checkNotNull(
                ascending,
                r'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault',
                'ascending'),
            index: BuiltValueNullFieldError.checkNotNull(
                index,
                r'GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault',
                'index'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asSeparatorFilter
    extends GFullSourceFragmentData_filters__asSeparatorFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asSeparatorFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asSeparatorFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asSeparatorFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asSeparatorFilter._(
      {required this.G__typename, required this.type, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asSeparatorFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asSeparatorFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asSeparatorFilter', 'name');
  }

  @override
  GFullSourceFragmentData_filters__asSeparatorFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asSeparatorFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asSeparatorFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asSeparatorFilterBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asSeparatorFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asSeparatorFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asSeparatorFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asSeparatorFilter,
            GFullSourceFragmentData_filters__asSeparatorFilterBuilder> {
  _$GFullSourceFragmentData_filters__asSeparatorFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asSeparatorFilterBuilder() {
    GFullSourceFragmentData_filters__asSeparatorFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asSeparatorFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asSeparatorFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asSeparatorFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asSeparatorFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asSeparatorFilter build() => _build();

  _$GFullSourceFragmentData_filters__asSeparatorFilter _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asSeparatorFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asSeparatorFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(type,
                r'GFullSourceFragmentData_filters__asSeparatorFilter', 'type'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GFullSourceFragmentData_filters__asSeparatorFilter', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter
    extends GFullSourceFragmentData_filters__asGroupFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final String name;
  @override
  final BuiltList<GFullSourceFragmentData_filters__asGroupFilter_filters>
      filters;

  factory _$GFullSourceFragmentData_filters__asGroupFilter(
          [void Function(GFullSourceFragmentData_filters__asGroupFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter._(
      {required this.G__typename,
      required this.type,
      required this.name,
      required this.filters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GFullSourceFragmentData_filters__asGroupFilter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFullSourceFragmentData_filters__asGroupFilter', 'name');
    BuiltValueNullFieldError.checkNotNull(
        filters, r'GFullSourceFragmentData_filters__asGroupFilter', 'filters');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter rebuild(
          void Function(GFullSourceFragmentData_filters__asGroupFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilterBuilder toBuilder() =>
      new GFullSourceFragmentData_filters__asGroupFilterBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullSourceFragmentData_filters__asGroupFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        name == other.name &&
        filters == other.filters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, filters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('name', name)
          ..add('filters', filters))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilterBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asGroupFilter,
            GFullSourceFragmentData_filters__asGroupFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GFullSourceFragmentData_filters__asGroupFilter_filters>? _filters;
  ListBuilder<GFullSourceFragmentData_filters__asGroupFilter_filters>
      get filters => _$this._filters ??= new ListBuilder<
          GFullSourceFragmentData_filters__asGroupFilter_filters>();
  set filters(
          ListBuilder<GFullSourceFragmentData_filters__asGroupFilter_filters>?
              filters) =>
      _$this._filters = filters;

  GFullSourceFragmentData_filters__asGroupFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _name = $v.name;
      _filters = $v.filters.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullSourceFragmentData_filters__asGroupFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullSourceFragmentData_filters__asGroupFilter;
  }

  @override
  void update(
      void Function(GFullSourceFragmentData_filters__asGroupFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter _build() {
    _$GFullSourceFragmentData_filters__asGroupFilter _$result;
    try {
      _$result = _$v ??
          new _$GFullSourceFragmentData_filters__asGroupFilter._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GFullSourceFragmentData_filters__asGroupFilter',
                  'G__typename'),
              type: BuiltValueNullFieldError.checkNotNull(type,
                  r'GFullSourceFragmentData_filters__asGroupFilter', 'type'),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  r'GFullSourceFragmentData_filters__asGroupFilter', 'name'),
              filters: filters.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filters';
        filters.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullSourceFragmentData_filters__asGroupFilter',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__base
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__base {
  @override
  final String G__typename;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__base(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__base',
        'G__typename');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__base rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder
    implements
        Builder<GFullSourceFragmentData_filters__asGroupFilter_filters__base,
            GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__base
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GFullSourceFragmentData_filters__asGroupFilter_filters__base;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__base build() =>
      _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__base _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asGroupFilter_filters__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final bool CheckBoxFilterDefault;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter._(
      {required this.G__typename,
      required this.type,
      required this.CheckBoxFilterDefault,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
        'type');
    BuiltValueNullFieldError.checkNotNull(
        CheckBoxFilterDefault,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
        'CheckBoxFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
        'name');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        CheckBoxFilterDefault == other.CheckBoxFilterDefault &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, CheckBoxFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('CheckBoxFilterDefault', CheckBoxFilterDefault)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _CheckBoxFilterDefault;
  bool? get CheckBoxFilterDefault => _$this._CheckBoxFilterDefault;
  set CheckBoxFilterDefault(bool? CheckBoxFilterDefault) =>
      _$this._CheckBoxFilterDefault = CheckBoxFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _CheckBoxFilterDefault = $v.CheckBoxFilterDefault;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
      _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
                'type'),
            CheckBoxFilterDefault: BuiltValueNullFieldError.checkNotNull(
                CheckBoxFilterDefault,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
                'CheckBoxFilterDefault'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter',
                'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter._(
      {required this.G__typename, required this.type, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter',
        'type');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter',
        'name');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
      _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter',
                'type'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter',
                'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final int SelectFilterDefault;
  @override
  final String name;
  @override
  final BuiltList<String> Gvalues;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter._(
      {required this.G__typename,
      required this.type,
      required this.SelectFilterDefault,
      required this.name,
      required this.Gvalues})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
        'type');
    BuiltValueNullFieldError.checkNotNull(
        SelectFilterDefault,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
        'SelectFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
        'name');
    BuiltValueNullFieldError.checkNotNull(
        Gvalues,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
        'Gvalues');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        SelectFilterDefault == other.SelectFilterDefault &&
        name == other.name &&
        Gvalues == other.Gvalues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, SelectFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, Gvalues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('SelectFilterDefault', SelectFilterDefault)
          ..add('name', name)
          ..add('Gvalues', Gvalues))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _SelectFilterDefault;
  int? get SelectFilterDefault => _$this._SelectFilterDefault;
  set SelectFilterDefault(int? SelectFilterDefault) =>
      _$this._SelectFilterDefault = SelectFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _Gvalues;
  ListBuilder<String> get Gvalues =>
      _$this._Gvalues ??= new ListBuilder<String>();
  set Gvalues(ListBuilder<String>? Gvalues) => _$this._Gvalues = Gvalues;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _SelectFilterDefault = $v.SelectFilterDefault;
      _name = $v.name;
      _Gvalues = $v.Gvalues.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
      _build() {
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
        _$result;
    try {
      _$result = _$v ??
          new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
                  'G__typename'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type,
                  r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
                  'type'),
              SelectFilterDefault: BuiltValueNullFieldError.checkNotNull(
                  SelectFilterDefault,
                  r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
                  'SelectFilterDefault'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name,
                  r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
                  'name'),
              Gvalues: Gvalues.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'Gvalues';
        Gvalues.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final _i1.GTriState TriStateFilterDefault;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter._(
      {required this.G__typename,
      required this.type,
      required this.TriStateFilterDefault,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
        'type');
    BuiltValueNullFieldError.checkNotNull(
        TriStateFilterDefault,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
        'TriStateFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
        'name');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        TriStateFilterDefault == other.TriStateFilterDefault &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, TriStateFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('TriStateFilterDefault', TriStateFilterDefault)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  _i1.GTriState? _TriStateFilterDefault;
  _i1.GTriState? get TriStateFilterDefault => _$this._TriStateFilterDefault;
  set TriStateFilterDefault(_i1.GTriState? TriStateFilterDefault) =>
      _$this._TriStateFilterDefault = TriStateFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _TriStateFilterDefault = $v.TriStateFilterDefault;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
      _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
                'type'),
            TriStateFilterDefault: BuiltValueNullFieldError.checkNotNull(
                TriStateFilterDefault,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
                'TriStateFilterDefault'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter',
                'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final String TextFilterDefault;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter._(
      {required this.G__typename,
      required this.type,
      required this.TextFilterDefault,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
        'type');
    BuiltValueNullFieldError.checkNotNull(
        TextFilterDefault,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
        'TextFilterDefault');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
        'name');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        TextFilterDefault == other.TextFilterDefault &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, TextFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('TextFilterDefault', TextFilterDefault)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _TextFilterDefault;
  String? get TextFilterDefault => _$this._TextFilterDefault;
  set TextFilterDefault(String? TextFilterDefault) =>
      _$this._TextFilterDefault = TextFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _TextFilterDefault = $v.TextFilterDefault;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
      _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
                'type'),
            TextFilterDefault: BuiltValueNullFieldError.checkNotNull(
                TextFilterDefault,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
                'TextFilterDefault'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter',
                'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault?
      SortFilterDefault;
  @override
  final String name;
  @override
  final BuiltList<String> Gvalues;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter._(
      {required this.G__typename,
      required this.type,
      this.SortFilterDefault,
      required this.name,
      required this.Gvalues})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
        'type');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
        'name');
    BuiltValueNullFieldError.checkNotNull(
        Gvalues,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
        'Gvalues');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        SortFilterDefault == other.SortFilterDefault &&
        name == other.name &&
        Gvalues == other.Gvalues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, SortFilterDefault.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, Gvalues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('SortFilterDefault', SortFilterDefault)
          ..add('name', name)
          ..add('Gvalues', Gvalues))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder?
      _SortFilterDefault;
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder
      get SortFilterDefault => _$this._SortFilterDefault ??=
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder();
  set SortFilterDefault(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder?
              SortFilterDefault) =>
      _$this._SortFilterDefault = SortFilterDefault;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _Gvalues;
  ListBuilder<String> get Gvalues =>
      _$this._Gvalues ??= new ListBuilder<String>();
  set Gvalues(ListBuilder<String>? Gvalues) => _$this._Gvalues = Gvalues;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _SortFilterDefault = $v.SortFilterDefault?.toBuilder();
      _name = $v.name;
      _Gvalues = $v.Gvalues.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
      _build() {
    _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
        _$result;
    try {
      _$result = _$v ??
          new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
              ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
                  'G__typename'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type,
                  r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
                  'type'),
              SortFilterDefault: _SortFilterDefault?.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name,
                  r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
                  'name'),
              Gvalues: Gvalues.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'SortFilterDefault';
        _SortFilterDefault?.build();

        _$failedField = 'Gvalues';
        Gvalues.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault {
  @override
  final String G__typename;
  @override
  final bool ascending;
  @override
  final int index;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault._(
      {required this.G__typename, required this.ascending, required this.index})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        ascending,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault',
        'ascending');
    BuiltValueNullFieldError.checkNotNull(
        index,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault',
        'index');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
      rebuild(
              void Function(
                      GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault &&
        G__typename == other.G__typename &&
        ascending == other.ascending &&
        index == other.index;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, ascending.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault')
          ..add('G__typename', G__typename)
          ..add('ascending', ascending)
          ..add('index', index))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _ascending;
  bool? get ascending => _$this._ascending;
  set ascending(bool? ascending) => _$this._ascending = ascending;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _ascending = $v.ascending;
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefaultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
      _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault',
                'G__typename'),
            ascending: BuiltValueNullFieldError.checkNotNull(
                ascending,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault',
                'ascending'),
            index: BuiltValueNullFieldError.checkNotNull(
                index,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault',
                'index'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
    extends GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter {
  @override
  final String G__typename;
  @override
  final String type;
  @override
  final String name;

  factory _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter(
          [void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder)?
              updates]) =>
      (new GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder()
            ..update(updates))
          ._build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter._(
      {required this.G__typename, required this.type, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter',
        'type');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter',
        'name');
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter rebuild(
          void Function(
                  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder
      toBuilder() =>
          new GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter &&
        G__typename == other.G__typename &&
        type == other.type &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('name', name))
        .toString();
  }
}

class GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder
    implements
        Builder<
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter,
            GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder> {
  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder() {
    GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
        ._initializeBuilder(this);
  }

  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter;
  }

  @override
  void update(
      void Function(
              GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilterBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
      build() => _build();

  _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
      _build() {
    final _$result = _$v ??
        new _$GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter',
                'G__typename'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter',
                'type'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter',
                'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
