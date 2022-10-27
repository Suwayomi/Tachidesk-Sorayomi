// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class SharedPreferenceNotifier<T> extends StateNotifier<T?> {
  SharedPreferenceNotifier({
    required this.client,
    required this.key,
    required this.initial,
  }) : super(initial);
  final String key;
  final SharedPreferences client;
  final T? initial;

  void load() => state = _get;

  T? get _get {
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

class SharedPreferenceEnumNotifier<T extends Enum> extends StateNotifier<T?> {
  SharedPreferenceEnumNotifier({
    required this.client,
    required this.key,
    required this.enumList,
    required this.initial,
  }) : super(initial);
  final String key;
  final List<T> enumList;
  final SharedPreferences client;
  final T? initial;

  T? _getEnumFromIndex(int? value) =>
      value != null && value < enumList.length ? enumList[value] : initial;

  void load() => state = _get;

  T? get _get => _getEnumFromIndex(client.getInt(key));

  Future<void> update(T value) async {
    if (await _set(value.index)) state = value;
  }

  Future<bool> _set(int value) => client.setInt(key, value);
}
