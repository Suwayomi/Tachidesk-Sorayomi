// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

// 🌎 Project imports:
import '../constants/db_keys.dart';
import '../constants/enum.dart';
import '../features/settings/presentation/server/credentials_popup.dart';
import '../features/settings/widgets/server_url_tile.dart';
import '../utils/storage/dio/dio_client.dart';
import '../utils/storage/dio/network_module.dart';
import '../utils/storage/local/shared_preferences_client.dart';

final packageInfoProvider =
    Provider<PackageInfo>((ref) => throw UnimplementedError());

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(
    dio: ref.watch(networkModuleProvider).provideDio(
          baseUrl: ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
          authType: ref.watch(authTypeProvider) ?? DBKeys.authType.initial,
          credentials: ref.watch(credentialsProvider),
        ),
  ),
);

final authTypeProvider =
    StateNotifierProvider<SharedPreferenceEnumNotifier<AuthType>, AuthType?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getInt(DBKeys.authType.name);
    return SharedPreferenceEnumNotifier<AuthType>(
      enumList: AuthType.values,
      client: client,
      key: DBKeys.authType.name,
      initial:
          initial == null ? DBKeys.authType.initial : AuthType.values[initial],
    );
  },
);
