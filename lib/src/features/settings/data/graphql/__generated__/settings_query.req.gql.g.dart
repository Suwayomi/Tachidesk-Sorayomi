// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_query.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GServerSettingsReq> _$gServerSettingsReqSerializer =
    new _$GServerSettingsReqSerializer();
Serializer<GSettingsFragmentReq> _$gSettingsFragmentReqSerializer =
    new _$GSettingsFragmentReqSerializer();

class _$GServerSettingsReqSerializer
    implements StructuredSerializer<GServerSettingsReq> {
  @override
  final Iterable<Type> types = const [GServerSettingsReq, _$GServerSettingsReq];
  @override
  final String wireName = 'GServerSettingsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GServerSettingsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GServerSettingsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GServerSettingsData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GServerSettingsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GServerSettingsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GServerSettingsVars))!
              as _i3.GServerSettingsVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation))! as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GServerSettingsData))!
              as _i2.GServerSettingsData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy?;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GSettingsFragmentReqSerializer
    implements StructuredSerializer<GSettingsFragmentReq> {
  @override
  final Iterable<Type> types = const [
    GSettingsFragmentReq,
    _$GSettingsFragmentReq
  ];
  @override
  final String wireName = 'GSettingsFragmentReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSettingsFragmentReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GSettingsFragmentVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i7.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSettingsFragmentReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSettingsFragmentReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GSettingsFragmentVars))!
              as _i3.GSettingsFragmentVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i7.DocumentNode))!
              as _i7.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ]))! as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GServerSettingsReq extends GServerSettingsReq {
  @override
  final _i3.GServerSettingsVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GServerSettingsData? Function(
      _i2.GServerSettingsData?, _i2.GServerSettingsData?)? updateResult;
  @override
  final _i2.GServerSettingsData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;
  @override
  final _i4.Context? context;

  factory _$GServerSettingsReq(
          [void Function(GServerSettingsReqBuilder)? updates]) =>
      (new GServerSettingsReqBuilder()..update(updates))._build();

  _$GServerSettingsReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen,
      this.context})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GServerSettingsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GServerSettingsReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, r'GServerSettingsReq', 'executeOnListen');
  }

  @override
  GServerSettingsReq rebuild(
          void Function(GServerSettingsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GServerSettingsReqBuilder toBuilder() =>
      new GServerSettingsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GServerSettingsReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen &&
        context == other.context;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jc(_$hash, requestId.hashCode);
    _$hash = $jc(_$hash, updateResult.hashCode);
    _$hash = $jc(_$hash, optimisticResponse.hashCode);
    _$hash = $jc(_$hash, updateCacheHandlerKey.hashCode);
    _$hash = $jc(_$hash, updateCacheHandlerContext.hashCode);
    _$hash = $jc(_$hash, fetchPolicy.hashCode);
    _$hash = $jc(_$hash, executeOnListen.hashCode);
    _$hash = $jc(_$hash, context.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GServerSettingsReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen)
          ..add('context', context))
        .toString();
  }
}

class GServerSettingsReqBuilder
    implements Builder<GServerSettingsReq, GServerSettingsReqBuilder> {
  _$GServerSettingsReq? _$v;

  _i3.GServerSettingsVarsBuilder? _vars;
  _i3.GServerSettingsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GServerSettingsVarsBuilder();
  set vars(_i3.GServerSettingsVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GServerSettingsData? Function(
      _i2.GServerSettingsData?, _i2.GServerSettingsData?)? _updateResult;
  _i2.GServerSettingsData? Function(
          _i2.GServerSettingsData?, _i2.GServerSettingsData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GServerSettingsData? Function(
                  _i2.GServerSettingsData?, _i2.GServerSettingsData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GServerSettingsDataBuilder? _optimisticResponse;
  _i2.GServerSettingsDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GServerSettingsDataBuilder();
  set optimisticResponse(_i2.GServerSettingsDataBuilder? optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  _i4.Context? _context;
  _i4.Context? get context => _$this._context;
  set context(_i4.Context? context) => _$this._context = context;

  GServerSettingsReqBuilder() {
    GServerSettingsReq._initializeBuilder(this);
  }

  GServerSettingsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _context = $v.context;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GServerSettingsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GServerSettingsReq;
  }

  @override
  void update(void Function(GServerSettingsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GServerSettingsReq build() => _build();

  _$GServerSettingsReq _build() {
    _$GServerSettingsReq _$result;
    try {
      _$result = _$v ??
          new _$GServerSettingsReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GServerSettingsReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, r'GServerSettingsReq', 'executeOnListen'),
              context: context);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GServerSettingsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSettingsFragmentReq extends GSettingsFragmentReq {
  @override
  final _i3.GSettingsFragmentVars vars;
  @override
  final _i7.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GSettingsFragmentReq(
          [void Function(GSettingsFragmentReqBuilder)? updates]) =>
      (new GSettingsFragmentReqBuilder()..update(updates))._build();

  _$GSettingsFragmentReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GSettingsFragmentReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GSettingsFragmentReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GSettingsFragmentReq', 'idFields');
  }

  @override
  GSettingsFragmentReq rebuild(
          void Function(GSettingsFragmentReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSettingsFragmentReqBuilder toBuilder() =>
      new GSettingsFragmentReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSettingsFragmentReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, document.hashCode);
    _$hash = $jc(_$hash, fragmentName.hashCode);
    _$hash = $jc(_$hash, idFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSettingsFragmentReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GSettingsFragmentReqBuilder
    implements Builder<GSettingsFragmentReq, GSettingsFragmentReqBuilder> {
  _$GSettingsFragmentReq? _$v;

  _i3.GSettingsFragmentVarsBuilder? _vars;
  _i3.GSettingsFragmentVarsBuilder get vars =>
      _$this._vars ??= new _i3.GSettingsFragmentVarsBuilder();
  set vars(_i3.GSettingsFragmentVarsBuilder? vars) => _$this._vars = vars;

  _i7.DocumentNode? _document;
  _i7.DocumentNode? get document => _$this._document;
  set document(_i7.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GSettingsFragmentReqBuilder() {
    GSettingsFragmentReq._initializeBuilder(this);
  }

  GSettingsFragmentReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSettingsFragmentReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSettingsFragmentReq;
  }

  @override
  void update(void Function(GSettingsFragmentReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSettingsFragmentReq build() => _build();

  _$GSettingsFragmentReq _build() {
    _$GSettingsFragmentReq _$result;
    try {
      _$result = _$v ??
          new _$GSettingsFragmentReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GSettingsFragmentReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GSettingsFragmentReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSettingsFragmentReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
