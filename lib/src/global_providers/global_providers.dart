// 📦 Package imports:
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../constants/db_keys.dart';
import '../constants/enum.dart';
import '../features/settings/presentation/server/credentials_popup.dart';
import '../features/settings/widgets/server_url_tile.dart';
import '../utils/storage/dio/dio_client.dart';
import '../utils/storage/dio/network_module.dart';
import '../utils/storage/local/shared_preferences_client.dart';

part 'global_providers.g.dart';

@riverpod
PackageInfo packageInfo(ref) => throw UnimplementedError();
@riverpod
DioClient dioClientKey(ref) => DioClient(
      dio: ref.watch(networkModuleProvider).provideDio(
            baseUrl: ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
            authType: ref.watch(authTypeKeyProvider) ?? DBKeys.authType.initial,
            credentials: ref.watch(credentialsProvider),
          ),
    );

@riverpod
class AuthTypeKey extends _$AuthTypeKey
    with SharedPreferenceEnumClient<AuthType> {
  @override
  AuthType? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.authType.initial;
    key = DBKeys.authType.name;
    enumList = AuthType.values;
    return get;
  }
}
