// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../extensions/custom_extensions/int_extensions.dart';

part 'shared_preferences_client.g.dart';

@riverpod
SharedPreferences sharedPreferences(ref) => throw UnimplementedError();

/// [SharedPreferenceClient] is a mixin to add [get] and [update] functions to
/// the provider.
///
/// * Remember to use [ initialize ] function to assign [_key], [_client]
///   in [build] function of provider.
///
/// * optionally provide [_initial] for giving initial value to the [_key].
///
/// * [T] should not be a Nullable Type.
mixin SharedPreferenceClient<T extends Object> {
  late final String _key;
  late final SharedPreferences _client;
  late final T? _initial;
  set state(T? newState);

  T? initialize({
    required SharedPreferences client,
    required key,
    T? initial,
  }) {
    this._client = client;
    this._key = key;
    this._initial = initial;
    return get;
  }

  T? get get {
    final value = _client.get(_key);
    return value is T? ? value : _initial;
  }

  Future<void> update(T? value) async {
    if (await _set(value)) state = value;
  }

  Future<bool> _set(T? value) async {
    if (value == null) return _client.remove(_key);
    if (value is bool) {
      return await _client.setBool(_key, value);
    } else if (value is double) {
      return await _client.setDouble(_key, value);
    } else if (value is int) {
      return await _client.setInt(_key, value);
    } else if (value is String) {
      return await _client.setString(_key, value);
    } else if (value is List<String>) {
      return await _client.setStringList(_key, value);
    }
    return false;
  }
}

/// [SharedPreferenceEnumClient] is a mixin to add [get] and [update] functions to
/// the provider.
///
/// * Remember to initialize [key], [client], [enumList] in [build] function of provider
/// * optionally provide [initial] for giving initial value to the [key].
mixin SharedPreferenceEnumClient<T extends Enum> {
  late String key;
  late SharedPreferences client;
  T? initial;
  late List<T> enumList;
  set state(T? newState);

  T? initialize({
    required SharedPreferences client,
    required key,
    required List<T> enumList,
    T? initial,
  }) {
    this.client = client;
    this.key = key;
    this.initial = initial;
    this.enumList = enumList;
    return get;
  }

  T? _getEnumFromIndex(int? value) =>
      value != null && value.liesBetween(upper: enumList.length - 1)
          ? enumList[value]
          : initial;

  T? get get => _getEnumFromIndex(client.getInt(key));

  Future<void> update(T? value) async {
    if (await _set(value == null ? null : enumList.indexOf(value))) {
      state = value;
    }
  }

  Future<bool> _set(int? value) {
    if (value == null) return client.remove(key);
    return client.setInt(key, value);
  }
}
