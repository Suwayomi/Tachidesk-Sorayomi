import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../constants/enum.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/pop_button.dart';
import '../../../../../widgets/radio_list_popup.dart';
import '../../../../../widgets/server_image.dart';
import '../../../../manga_book/domain/manga/manga_model.dart';
import '../../../data/tracking/tracking_repository.dart';
import '../../../domain/tracking/tracking_model.dart';

class TrackerStatusWidget extends ConsumerWidget {
  const TrackerStatusWidget(
      {super.key,
      required this.manga,
      required this.tracker,
      required this.refresh});

  final Manga manga;
  final MangaTracker tracker;
  final AsyncCallback refresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.read(toastProvider(context));
    final record = tracker.record!;
    final processingText = context.l10n!.processing;
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Row(
            children: [
              // tracker icon
              Padding(
                padding: KEdgeInsets.a8.size,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ServerImage(
                    imageUrl: tracker.icon ?? "",
                    size: const Size.square(40),
                  ),
                ),
              ),
              // manga title
              Expanded(
                  child: Padding(
                padding: KEdgeInsets.a8.size,
                child: Text(
                  record.title ?? "",
                  style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
              )),
              PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: KBorderRadius.r16.radius,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(context.l10n!.openInBrowser),
                          onTap: () async {
                            launchUrlInWeb(
                              context,
                              record.remoteUrl ?? "",
                              toast,
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: Text(context.l10n!.remove),
                          onTap: () async {
                            await updateRemote(
                                toast,
                                processingText,
                                ref,
                                TrackUpdate(
                                    recordId: record.id!, unbind: true));
                          },
                        ),
                      ])
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                children: [
                  // status
                  Expanded(
                    child: TrackButtonWidget(
                      text: TrackingStatus.fromText(
                              tracker.statusTextMap?[record.status])
                          .toLocale(context),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => RadioListConfirmPopup<int>(
                          optionList: tracker.statusList ?? [],
                          optionDisplayName: (value) => TrackingStatus.fromText(
                                  tracker.statusTextMap?[value])
                              .toLocale(context),
                          title: context.l10n!.trackingStatus,
                          value: record.status ?? 0,
                          onConfirm: (value) async {
                            await updateRemote(
                                toast,
                                processingText,
                                ref,
                                TrackUpdate(
                                    recordId: record.id!, status: value));
                            if (context.mounted) context.pop();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: TrackButtonWidget(
                      text: record.totalChapters.isGreaterThan(0)
                          ? "${record.lastChapterRead?.toInt() ?? 0}/${record.totalChapters}"
                          : "${record.lastChapterRead?.toInt() ?? 0}",
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => NumberPickerPopup(
                          title: context.l10n!.trackingChapter,
                          minValue: 0,
                          maxValue: record.totalChapters.isGreaterThan(0)
                              ? record.totalChapters!
                              : 10000,
                          value: record.lastChapterRead?.toInt() ?? 0,
                          onConfirm: (value) async {
                            await updateRemote(
                                toast,
                                processingText,
                                ref,
                                TrackUpdate(
                                    recordId: record.id!,
                                    lastChapterRead: value.toDouble()));
                            if (context.mounted) context.pop();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: TrackButtonWidget(
                      text: record.scoreString ?? "",
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => RadioListConfirmPopup<String>(
                          optionList: tracker.scoreList ?? [],
                          title: context.l10n!.trackingScore,
                          value: record.scoreString ?? "",
                          onConfirm: (value) async {
                            await updateRemote(
                                toast,
                                processingText,
                                ref,
                                TrackUpdate(
                                    recordId: record.id!, scoreString: value));
                            if (context.mounted) context.pop();
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                children: [
                  Expanded(
                    child: TrackButtonWidget(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20)),
                      text: record.startDate != null && record.startDate != 0
                          ? record.startDate.toDateString
                          : context.l10n!.trackingStartDate,
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            helpText: context.l10n!.trackingStartDate,
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) return;
                        await updateRemote(
                            toast,
                            processingText,
                            ref,
                            TrackUpdate(
                                recordId: record.id!,
                                startDate: newDate.millisecondsSinceEpoch));
                      },
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: TrackButtonWidget(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20)),
                      text: record.finishDate != null && record.finishDate != 0
                          ? record.finishDate.toDateString
                          : context.l10n!.trackingFinishDate,
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            helpText: context.l10n!.trackingFinishDate,
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) return;
                        await updateRemote(
                            toast,
                            processingText,
                            ref,
                            TrackUpdate(
                                recordId: record.id!,
                                finishDate: newDate.millisecondsSinceEpoch));
                      },
                    ),
                  ),
                ],
              )),
        ]));
  }

  Future<void> updateRemote(
      Toast toast, String text, WidgetRef ref, TrackUpdate trackUpdate) async {
    toast.show(text);
    (await AsyncValue.guard(
      () async {
        await ref.read(trackingRepositoryProvider).update(trackUpdate);
        await refresh();
        toast.close();
      },
    ))
        .showToastOnError(toast);
  }

  String statusTextToLocale(String? statusText, BuildContext context) {
    if (statusText == "reading") {
      return context.l10n!.trackingStatusReading;
    } else if (statusText == "plan_to_read") {
      return context.l10n!.trackingStatusPlanToRead;
    } else if (statusText == "completed") {
      return context.l10n!.trackingStatusCompleted;
    } else if (statusText == "on_hold") {
      return context.l10n!.trackingStatusOnHold;
    } else if (statusText == "dropped") {
      return context.l10n!.trackingStatusDropped;
    } else if (statusText == "repeating") {
      return context.l10n!.trackingStatusRereading;
    }
    return "";
  }
}

class TrackButtonWidget extends ConsumerWidget {
  const TrackButtonWidget(
      {super.key, required this.text, this.borderRadius, this.onPressed});

  final String text;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 0,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.1)),
              borderRadius: borderRadius ?? BorderRadius.circular(0))),
      onPressed: onPressed,
      child: Text(text, style: context.textTheme.bodyMedium),
    );
  }
}

class RadioListConfirmPopup<T> extends HookConsumerWidget {
  const RadioListConfirmPopup({
    super.key,
    required this.title,
    required this.optionList,
    required this.value,
    required this.onConfirm,
    this.optionDisplayName,
    this.optionDisplaySubName,
  });

  final String title;
  final List<T> optionList;
  final T value;
  final ValueChanged<T> onConfirm;
  final String Function(T)? optionDisplayName;
  final String Function(T)? optionDisplaySubName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = useState(value);
    return AlertDialog(
      contentPadding: KEdgeInsets.v8.size,
      title: Text(title),
      content: RadioList(
        optionList: optionList,
        value: v.value,
        onChange: (value) {
          v.value = value;
        },
        getTitle: optionDisplayName,
        getSubtitle: optionDisplaySubName,
      ),
      actions: [
        const PopButton(),
        TextButton(
          onPressed: () {
            onConfirm(v.value);
          },
          child: Text(context.l10n!.ok),
        )
      ],
    );
  }
}

class NumberPickerPopup extends HookConsumerWidget {
  const NumberPickerPopup({
    super.key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onConfirm,
  });

  final String title;
  final int minValue;
  final int maxValue;
  final int value;
  final ValueChanged<int> onConfirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = useState(value);
    return AlertDialog(
      contentPadding: KEdgeInsets.v8.size,
      title: Text(title),
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker(
              value: v.value,
              minValue: min(value, minValue),
              maxValue: max(value, maxValue),
              step: 1,
              haptics: true,
              onChanged: (value) {
                v.value = value;
              },
            ),
          ],
        ),
      ),
      actions: [
        const PopButton(),
        TextButton(
          onPressed: () {
            onConfirm(v.value);
          },
          child: Text(context.l10n!.ok),
        )
      ],
    );
  }
}
