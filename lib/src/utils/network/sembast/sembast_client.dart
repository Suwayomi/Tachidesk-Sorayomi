// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';

// 🌎 Project imports:
import '../../../constants/db_keys.dart';
import '../../extensions/custom_extensions/string_extensions.dart';

// 📦 Package imports:

// 🌎 Project imports:

final databaseProvider =
    Provider<Database>((ref) => throw UnimplementedError());

class SembastDatabase {
  SembastDatabase({required this.db, String? storeName});
  final Database db;

  static Future<Database> _createDatabase(
    String filename,
    PackageInfo packageInfo,
  ) async =>
      getDatabaseFactory(packageName: packageInfo.packageName)
          .openDatabase(filename);

  static Future<SembastDatabase> makeDefault(PackageInfo packageInfo) async =>
      SembastDatabase(db: await _createDatabase('default.db', packageInfo));
}

final sembastDatabaseProvider = Provider<SembastDatabase>(
  (ref) => throw UnimplementedError(),
);

class SembastClient {
  SembastClient({required this.db, required String? storeName}) {
    store = storeName.isNotBlank
        ? StoreRef<String, dynamic>(storeName!)
        : StoreRef.main();
  }
  final Database db;
  late final StoreRef<String, dynamic> store;

  /// Add or Update the value of the matching key and returns value
  Future<dynamic> update(String key, dynamic value) =>
      store.record(key).put(db, value);

  /// Removes the value of the matching key and returns key
  Future<String?> delete(String key) => store.record(key).delete(db);

  /// Returns the value of the matching key
  Future<dynamic> get(String key) => store.record(key).get(db);

  /// Returns the value of the matching key
  Stream<RecordSnapshot<String, dynamic>?> getStream(String key) =>
      store.record(key).onSnapshot(db);
}

final settingsLocalProvider = Provider<SembastClient>(
  (ref) => SembastClient(
    db: ref.watch(sembastDatabaseProvider).db,
    storeName: DBStoreName.settings.name,
  ),
);
