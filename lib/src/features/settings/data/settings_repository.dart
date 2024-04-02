import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../global_providers/global_providers.dart';
import '../../../utils/extensions/custom_extensions.dart';
import 'graphql/__generated__/settings_query.data.gql.dart';
import 'graphql/settings_query.dart';

part 'settings_repository.g.dart';

typedef SettingsDto = GSettingsFragment;

class SettingsRepository {
  const SettingsRepository(this.ferryClient);

  final Client ferryClient;

  Stream<SettingsDto?> getServerSettings() => ferryClient.fetch(
        SettingsQuery.serverSettings(),
        (data) => data.settings,
      );
}

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) =>
    SettingsRepository(ref.watch(ferryClientProvider));
