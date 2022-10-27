// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

// 🌎 Project imports:
import '../constants/db_keys.dart';
import '../constants/endpoints.dart';
import '../constants/enum.dart';
import '../features/settings/data/local_settings_repository.dart';
import '../features/settings/widgets/server_url_tile.dart';
import '../utils/network/dio/dio_client.dart';
import '../utils/network/dio/network_module.dart';
import '../utils/network/sembast/sembast_client.dart';

final packageInfoProvider =
    Provider<PackageInfo>((ref) => throw UnimplementedError());

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(
    dio: ref.watch(networkModuleProvider).provideDio(),
    updateDio: (dio) async {
      final String baseUrl =
          Endpoints.baseApi(baseUrl: await ref.read(serverUrlProvider).get());

      final AuthType authType =
          await ref.read(authTypeProvider).get() ?? AuthType.none;

      final headers = Map.of(dio.options.headers);
      if (authType == AuthType.basic) {
        final baseAuth = await ref.read(baseTokenProvider).get();
        headers.putIfAbsent("Authorization", () => baseAuth);
      }

      return dio
        ..options.baseUrl = baseUrl
        ..options.headers = headers;
    },
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

final authTypeStreamProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(authTypeProvider).getStream());

final baseTokenProvider = Provider.autoDispose(
  (ref) => LocalSettingsRepository<String>(
    ref.watch(settingsLocalProvider),
    DBKeys.basicCredentials,
  ),
);

final basicTokenStreamProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(baseTokenProvider).getStream());
