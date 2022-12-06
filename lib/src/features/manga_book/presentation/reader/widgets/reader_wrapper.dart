// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../constants/enum.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/enum_popup.dart';
import '../../../data/manga_book_repository.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/chapter_patch/chapter_put_model.dart';
import '../../../domain/manga/manga_model.dart';
import '../../../widgets/chapter_actions/single_chapter_action_icon.dart';
import '../../manga_details/controller/manga_details_controller.dart';
import '../controller/reader_controller.dart';
import 'page_number_slider.dart';
import 'reader_navigation_layout/reader_navigation_layout.dart';

class NextScrollIntent extends Intent {}

class PreviousScrollIntent extends Intent {}

class ReaderWrapper extends HookConsumerWidget {
  const ReaderWrapper({
    Key? key,
    required this.child,
    required this.manga,
    required this.chapter,
    required this.onChanged,
    required this.currentIndex,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);
  final Widget child;
  final Manga manga;
  final Chapter chapter;
  final ValueChanged<int> onChanged;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final int currentIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prevNextChapterPair = ref.watch(
      getPreviousAndNextChaptersProvider(
        mangaId: "${manga.id}",
        chapterIndex: "${chapter.index}",
      ),
    );
    final visibility = useState(true);
    final defaultReaderMode = manga.meta.isNotBlank
        ? ReaderMode.values.firstWhere(
            (element) =>
                element.name == manga.meta![ChapterMeta.readerMode.key],
            orElse: () => ReaderMode.defaultReader,
          )
        : ReaderMode.defaultReader;

    final showReaderModePopup = useCallback(
        () => showDialog(
              context: context,
              builder: (context) => EnumPopup<ReaderMode>(
                enumList: ReaderMode.values,
                value: defaultReaderMode,
                onChange: (enumValue) async {
                  if (context.mounted) context.pop();

                  await AsyncValue.guard(
                    () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                          mangaId: "${manga.id}",
                          key: ChapterMeta.readerMode.key,
                          value: enumValue.name,
                        ),
                  );
                  ref.invalidate(
                    mangaWithIdProvider(mangaId: "${manga.id}"),
                  );
                },
              ),
            ),
        []);

    final defaultReaderNavigationLayout = manga.meta.isNotBlank
        ? ReaderNavigationLayout.values.firstWhere(
            (element) =>
                element.name ==
                manga.meta![ChapterMeta.readerNavigationLayout.key],
            orElse: () => ReaderNavigationLayout.defaultNavigation,
          )
        : ReaderNavigationLayout.defaultNavigation;

    final showReaderNavigationLayoutPopup = useCallback(
        () => showDialog(
              context: context,
              builder: (context) => EnumPopup<ReaderNavigationLayout>(
                enumList: ReaderNavigationLayout.values,
                value: defaultReaderNavigationLayout,
                onChange: (enumValue) async {
                  if (context.mounted) context.pop();

                  await AsyncValue.guard(
                    () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                          mangaId: "${manga.id}",
                          key: ChapterMeta.readerNavigationLayout.key,
                          value: enumValue.name,
                        ),
                  );
                  ref.invalidate(
                    mangaWithIdProvider(mangaId: "${manga.id}"),
                  );
                },
              ),
            ),
        []);

    return Theme(
      data: context.theme.copyWith(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      child: Scaffold(
        appBar: visibility.value
            ? AppBar(
                title: ListTile(
                  title: (manga.title).isNotBlank
                      ? Text(
                          "${manga.title}",
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  subtitle: (chapter.name).isNotBlank
                      ? Text(
                          "${chapter.name}",
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                ),
                elevation: 0,
                backgroundColor: Colors.black.withOpacity(.7),
              )
            : null,
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomSheet: visibility.value
            ? ExcludeFocus(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Card(
                          color: Colors.black.withOpacity(.7),
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: prevNextChapterPair?.second != null
                                ? () => context.replace(
                                      Routes.getReader(
                                        "${prevNextChapterPair!.second!.mangaId}",
                                        "${prevNextChapterPair.second!.index}",
                                      ),
                                    )
                                : null,
                            icon: const Icon(
                              Icons.skip_previous_rounded,
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageNumberSlider(
                            currentValue: currentIndex,
                            maxValue: chapter.pageCount ?? 1,
                            onChanged: (index) => onChanged(index),
                          ),
                        ),
                        Card(
                          color: Colors.black.withOpacity(.7),
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: prevNextChapterPair?.first != null
                                ? () => context.replace(
                                      Routes.getReader(
                                        "${prevNextChapterPair!.first!.mangaId}",
                                        "${prevNextChapterPair.first!.index}",
                                      ),
                                    )
                                : null,
                            icon: const Icon(Icons.skip_next_rounded),
                          ),
                        )
                      ],
                    ),
                    KSizedBox.h8.size,
                    Container(
                      color: Colors.black.withOpacity(.7),
                      padding: KEdgeInsets.h16v8.size,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (chapter.index != null &&
                              chapter.bookmarked != null)
                            SingleChapterActionIcon(
                              icon: chapter.bookmarked!
                                  ? Icons.bookmark_rounded
                                  : Icons.bookmark_outline_rounded,
                              chapterIndex: "${chapter.index!}",
                              mangaId: "${manga.id}",
                              chapterPut: ChapterPut(
                                bookmarked: !chapter.bookmarked!,
                              ),
                              refresh: () async {
                                if (manga.id != null && chapter.index != null) {
                                  return ref.refresh(chapterProvider(
                                    mangaId: "${manga.id!}",
                                    chapterIndex: "${chapter.index!}",
                                  ).future);
                                }
                              },
                            ),
                          IconButton(
                            icon: const Icon(Icons.app_settings_alt_outlined),
                            onPressed: showReaderModePopup,
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                clipBehavior: Clip.hardEdge,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          Icons.app_settings_alt_outlined,
                                        ),
                                        title: Text(
                                          LocaleKeys.readerMode.tr(),
                                        ),
                                        subtitle: Text(
                                          defaultReaderMode.toString().tr(),
                                        ),
                                        onTap: () {
                                          context.pop();
                                          showReaderModePopup();
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.touch_app_rounded,
                                        ),
                                        title: Text(
                                          LocaleKeys.readerNavigationLayout
                                              .tr(),
                                        ),
                                        subtitle: Text(
                                          defaultReaderNavigationLayout
                                              .toString()
                                              .tr(),
                                        ),
                                        onTap: () {
                                          context.pop();
                                          showReaderNavigationLayoutPopup();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.settings_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : null,
        body: Shortcuts(
          shortcuts: {
            const SingleActivator(LogicalKeyboardKey.arrowLeft):
                PreviousScrollIntent(),
            const SingleActivator(LogicalKeyboardKey.arrowRight):
                NextScrollIntent(),
            const SingleActivator(LogicalKeyboardKey.arrowUp):
                PreviousScrollIntent(),
            const SingleActivator(LogicalKeyboardKey.arrowDown):
                NextScrollIntent(),
            const SingleActivator(LogicalKeyboardKey.keyW):
                PreviousScrollIntent(),
            const SingleActivator(LogicalKeyboardKey.keyS): NextScrollIntent(),
            const SingleActivator(LogicalKeyboardKey.keyA):
                PreviousScrollIntent(),
            const SingleActivator(LogicalKeyboardKey.keyD): NextScrollIntent(),
          },
          child: Actions(
            actions: {
              PreviousScrollIntent: CallbackAction<PreviousScrollIntent>(
                onInvoke: (intent) => onPrevious(),
              ),
              NextScrollIntent: CallbackAction<NextScrollIntent>(
                onInvoke: (intent) => onNext(),
              ),
            },
            child: Focus(
              autofocus: true,
              child: GestureDetector(
                onTap: () => visibility.value = !visibility.value,
                behavior: HitTestBehavior.translucent,
                child: Stack(
                  children: [
                    child,
                    ReaderNavigationLayoutWidget(
                      onNext: onNext,
                      onPrevious: onPrevious,
                      navigationLayout: defaultReaderNavigationLayout,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
