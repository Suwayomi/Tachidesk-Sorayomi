// 📦 Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_client.g.dart';

@riverpod
SharedPreferences sharedPreferences(ref) => throw UnimplementedError();

/// [SharedPreferenceClient] is a mixin to add [get] and [update] functions to
/// the provider.
///
/// * Remember to initialize [key], [client] in [build] function of provider
/// * optionally provide [initial] for giving initial value to the [key].
mixin SharedPreferenceClient<T> {
  late String key;
  late SharedPreferences client;
  T? initial;
  set state(T? newState);

  T? get get {
    final value = client.get(key);
    return value is T? ? value : initial;
  }

  Future<void> update(T? value) async {
    if (await _set(value)) state = value;
  }

  Future<bool> _set(T? value) async {
    if (value == null) return client.remove(key);
    if (value is bool) {
      return await client.setBool(key, value);
    } else if (value is double) {
      return await client.setDouble(key, value);
    } else if (value is int) {
      return await client.setInt(key, value);
    } else if (value is String) {
      return await client.setString(key, value);
    } else if (value is List<String>) {
      return await client.setStringList(key, value);
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

  T? _getEnumFromIndex(int? value) =>
      value != null && value < enumList.length ? enumList[value] : initial;

  T? get get => _getEnumFromIndex(client.getInt(key));

  Future<void> update(T? value) async {
    if (await _set(value?.index)) state = value;
  }

  Future<bool> _set(int? value) {
    if (value == null) return client.remove(key);
    return client.setInt(key, value);
  }
}
