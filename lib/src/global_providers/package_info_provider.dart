import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/db_keys.dart';
import '../constants/enum.dart';
import '../features/settings/data/local_settings_repository.dart';
import '../utils/network/dio/dio_client.dart';
import '../utils/network/dio/network_module.dart';
import '../utils/network/sembast/sembast_client.dart';

final packageInfoProvider =
    Provider<PackageInfo>((ref) => throw UnimplementedError());

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(
    dio: ref.watch(networkModuleProvider).provideDio(),
    ref: ref,
  ),
);

final authTypeProvider = Provider.autoDispose(
  (ref) => LocalEnumSettingsRepository<AuthType>(
    enumList: AuthType.values,
    client: ref.watch(settingsLocalProvider),
    key: DBKeys.authType,
    initial: AuthType.none,
  ),
);

final baseTokenProvider = Provider.autoDispose(
  (ref) => LocalSettingsRepository<String>(
    ref.watch(settingsLocalProvider),
    DBKeys.basicCredentials,
  ),
);
