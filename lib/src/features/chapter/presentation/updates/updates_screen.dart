// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/features/chapter/data/chapter_repository.dart';
import 'package:tachidesk_sorayomi/src/features/chapter/domain/chapter_page/chapter_page_model.dart';
import 'package:tachidesk_sorayomi/src/features/chapter/presentation/updates/chapter_manga_list_tile.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/async_value_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/int_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/hooks/paging_controller_hook.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast/toast.dart';

class UpdatesScreen extends HookConsumerWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  Future<void> _fetchPage(
    ChapterRepository repository,
    PagingController controller,
    int pageKey,
  ) async {
    ChapterPage? recentChaptersPage =
        await repository.getRecentChaptersPage(pageNo: pageKey);
    if (recentChaptersPage != null) {
      if (recentChaptersPage.hasNextPage ?? false) {
        try {
          controller.appendPage(recentChaptersPage.page ?? [], pageKey + 1);
        } catch (e) {
          controller.appendPage([], pageKey);
        }
      } else {
        controller.appendLastPage(recentChaptersPage.page ?? []);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        usePagingController<int, ChapterMangaPair>(firstPageKey: 0);
    final chapterRepository = ref.watch(chapterRepositoryProvider);
    final toast = ref.watch(toastProvider(context));
    useEffect(() {
      controller.addPageRequestListener((pageKey) => _fetchPage(
            chapterRepository,
            controller,
            pageKey,
          ));
      return;
    }, []);
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.screenTitle_updates.tr())),
      body: RefreshIndicator(
        onRefresh: () async => controller.refresh(),
        child: PagedListView(
          pagingController: controller,
          builderDelegate: PagedChildBuilderDelegate<ChapterMangaPair>(
            itemBuilder: (context, item, index) {
              int? previousDate;
              try {
                previousDate =
                    controller.itemList?[index - 1].chapter?.fetchedAt;
              } catch (e) {
                previousDate = null;
              }
              final chapterTile = ChapterMangaListTile(
                pair: item,
                toast: toast,
                updatePair: () async {
                  try {
                    final chapter = (await AsyncValue.guard(
                        () => ref.read(chapterRepositoryProvider).getChapter(
                              mangaId: item.manga!.id!,
                              chapterIndex: item.chapter!.index!,
                            )))
                      ..showToastOnError(toast);
                    controller.itemList = [...?controller.itemList]
                      ..replaceRange(index, index + 1, [
                        item.copyWith(
                          chapter: chapter.valueOrNull ?? item.chapter,
                        )
                      ]);
                  } catch (e) {
                    //
                  }
                },
              );
              if ((item.chapter?.fetchedAt).isSameDayAs(previousDate)) {
                return chapterTile;
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(item.chapter!.fetchedAt.toDaysAgoFromSeconds),
                    ),
                    chapterTile,
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
