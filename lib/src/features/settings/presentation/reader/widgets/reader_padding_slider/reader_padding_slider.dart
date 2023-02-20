// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../constants/db_keys.dart';

import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/storage/local/shared_preferences_client.dart';

part 'reader_padding_slider.g.dart';

@riverpod
class ReaderPaddingKey extends _$ReaderPaddingKey
    with SharedPreferenceClient<double> {
  @override
  double? build() => initialize(
        ref,
        initial: DBKeys.readerPadding.initial,
        key: DBKeys.readerPadding.name,
      );
}

class ReaderPaddingSlider extends ConsumerWidget {
  const ReaderPaddingSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double readerPadding =
        ref.watch(readerPaddingKeyProvider) ?? DBKeys.readerPadding.initial;
    return ListTile(
      leading: const Icon(Icons.width_wide_rounded),
      title: Text(context.l10n!.readerPadding),
      trailing: IconButton(
        onPressed: () => ref
            .read(readerPaddingKeyProvider.notifier)
            .update(DBKeys.readerPadding.initial),
        icon: const Icon(Icons.refresh),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Slider(
              label: readerPadding.toString(),
              value: readerPadding,
              min: 0,
              max: .4,
              onChanged: (value) =>
                  ref.read(readerPaddingKeyProvider.notifier).update(value),
            ),
          ),
          Text((readerPadding * 2.5).toStringAsFixed(2)),
        ],
      ),
    );
  }
}

class AsyncReaderPaddingSlider extends HookWidget {
  const AsyncReaderPaddingSlider({
    super.key,
    required this.onChanged,
    required this.readerPadding,
  });

  final ValueSetter<double> onChanged;
  final ValueNotifier<double> readerPadding;

  @override
  Widget build(BuildContext context) {
    final debounce = useRef<Timer?>(null);

    final onDebounceChanged = useCallback<ValueSetter<double>>(
      (double paddingValue) async {
        readerPadding.value = paddingValue;
        final finalDebounce = debounce.value;
        if ((finalDebounce?.isActive).ifNull()) {
          finalDebounce?.cancel();
        }
        debounce.value = Timer(
          const Duration(milliseconds: 500),
          () => onChanged(paddingValue),
        );
        return;
      },
      [],
    );

    return ListTile(
      leading: const Icon(Icons.width_wide_rounded),
      title: Text(context.l10n!.readerPadding),
      trailing: IconButton(
        onPressed: () => onDebounceChanged(DBKeys.readerPadding.initial),
        icon: const Icon(Icons.refresh),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Slider(
              label: readerPadding.value.toString(),
              value: readerPadding.value,
              min: 0,
              max: .4,
              onChanged: onDebounceChanged,
            ),
          ),
          Text((readerPadding.value * 2.5).toStringAsFixed(2)),
        ],
      ),
    );
  }
}
