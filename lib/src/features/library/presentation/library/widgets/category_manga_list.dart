// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../data/category/category_repository.dart';
import '../../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/emoticons.dart';
import '../../../../../widgets/manga_cover/manga_cover_grid.dart';
import '../../../../../i18n/locale_keys.g.dart';

class CategoryMangaList extends ConsumerWidget {
  const CategoryMangaList({Key? key, required this.categoryId})
      : super(key: key);
  final int categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = categoryMangaListProvider(categoryId: categoryId);
    final mangaList = ref.watch(provider);
    refresh() => ref.refresh(provider.future);
    return mangaList.when(
      data: (data) {
        if (data.isBlank) {
          return Emoticons(
            text: LocaleKeys.noCategoryMangaFound.tr(),
            button: TextButton(
              onPressed: () => ref.refresh(provider.future),
              child: Text(LocaleKeys.refresh.tr()),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: refresh,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 192,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 0.75,
            ),
            itemCount: data?.length ?? 0,
            itemBuilder: (context, index) => MangaCoverGrid(
              manga: data![index],
              onTap: () {},
              isLibraryScreen: true,
            ),
          ),
        );
      },
      error: (e, s) => Emoticons(
        text: e.toString(),
        button: TextButton(
          onPressed: refresh,
          child: Text(LocaleKeys.refresh.tr()),
        ),
      ),
      loading: () => const CenterCircularProgressIndicator(),
    );
  }
}
