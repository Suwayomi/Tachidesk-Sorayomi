import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/utils/network/sembast/sembast_client.dart';

class LocalSettingsRepository<T> {
  LocalSettingsRepository(this.client, this.key, {this.initial, this.cast}) {
    load();
  }
  final SembastClient client;
  final DBKeys key;
  final T? initial;
  final T? Function(dynamic)? cast;

  Future<void> load() async {
    if ((await client.get(key.name)) == null &&
        (initial ?? key.initial) != null) {
      await update(initial ?? key.initial);
    }
  }

  Future<T?> get() async {
    final value = await client.get(key.name);
    try {
      return cast != null ? cast!(value) : (value as T?);
    } catch (e) {
      return null;
    }
  }

  Future<T?> update(T value) async {
    final updatedValue = await client.update(key.name, value);
    try {
      return cast != null ? cast!(updatedValue) : (updatedValue as T?);
    } catch (e) {
      return null;
    }
  }

  Stream<T?> getStream() => client.getStream(key.name).map(
        (event) {
          try {
            return cast != null ? cast!(event?.value) : (event?.value as T?);
          } catch (e) {
            return null;
          }
        },
      );
}

class LocalEnumSettingsRepository<T extends Enum> {
  LocalEnumSettingsRepository({
    required this.enumList,
    required this.client,
    required this.key,
    this.initial,
  }) {
    load();
  }
  final List<T> enumList;
  final SembastClient client;
  final DBKeys key;
  final T? initial;

  T _getEnumFromIndex(String? index) =>
      enumList[int.tryParse(index ?? '0') ?? 0];

  Future<void> load() async {
    if ((await client.get(key.name)) == null &&
        (initial ?? key.initial) != null) {
      await update(initial ?? key.initial);
    }
  }

  Future<T?> get() async =>
      _getEnumFromIndex((await client.get(key.name)).toString());

  Future<void> update(T value) async => _getEnumFromIndex(
        (await client.update(
          key.name,
          value.index.toString(),
        ))
            .toString(),
      );

  Stream<T?> getStream() => client
      .getStream(key.name)
      .map((event) => _getEnumFromIndex((event?.value).toString()));
}
