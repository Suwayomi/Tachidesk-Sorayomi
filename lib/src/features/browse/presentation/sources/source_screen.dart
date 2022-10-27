// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../constants/enum.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/misc/toast.dart';
import '../../../settings/widgets/server_url_tile.dart';
import '../../domain/language/language_model.dart';
import 'controller/source_controller.dart';

class SourceScreen extends HookConsumerWidget {
  const SourceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final sourceMap = ref.watch(sourceMapProvider);
    final languageMap = ref.watch(languageMapWithCustomProvider);
    final baseUrl = ref.watch(serverUrlStreamProvider);
    final authType = ref.watch(authTypeStreamProvider);
    final basicToken = ref.watch(basicTokenStreamProvider);
    ref.listen(
      sourceControllerProvider,
      ((_, state) => state.showToastOnError(toast)),
    );
    useEffect(() {
      Future.microtask(
        ref.read(sourceControllerProvider.notifier).loadSources,
      );
      return;
    }, []);
    return CustomScrollView(
      slivers: [
        for (final k in sourceMap.keys) ...[
          SliverToBoxAdapter(
            child: ListTile(
              title:
                  Text(languageMap[k]?.nativeName ?? languageMap[k]?.name ?? k),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final source = sourceMap[k]![index];
                return ListTile(
                    onTap: (() async {
                      // await controller.localStorageService
                      //     .setLastUsed(source.id);
                      // Get.toNamed(
                      //   "${Routes.sourceManga}/${source.id}/popular",
                      // );
                    }),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            (baseUrl.valueOrNull ?? DBKeys.serverUrl.initial) +
                                (source.iconUrl ?? ""),
                        height: 48,
                        httpHeaders: authType.valueOrNull == AuthType.basic &&
                                basicToken.valueOrNull != null
                            ? {"Authorization": basicToken.value!}
                            : null,
                        width: 48,
                        fit: BoxFit.cover,
                        errorWidget: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image_rounded),
                      ),
                    ),
                    title: Text(source.displayName ?? source.name ?? ""),
                    subtitle: Text(languageMap[source.lang]?.nativeName ??
                        languageMap[source.lang]?.name ??
                        k),
                    trailing: (source.supportsLatest ?? false)
                        ? TextButton(
                            onPressed: () async {
                              // await controller.localStorageService
                              //     .setLastUsed(source.id);
                              // Get.toNamed("${Routes.sourceManga}"
                              //     "/${source.id}/latest");
                            },
                            child: Text(
                              LocaleKeys.sourceScreen_latest.tr(),
                            ),
                          )
                        : null);
              },
              childCount: sourceMap[k]?.length,
            ),
          )
        ],
      ],
    );
  }
}
