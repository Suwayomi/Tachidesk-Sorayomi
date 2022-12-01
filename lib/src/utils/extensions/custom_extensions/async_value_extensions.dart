// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../i18n/locale_keys.g.dart';
import '../../../widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/emoticons.dart';
import '../../misc/toast/toast.dart';

extension AsyncValueExtensions<T> on AsyncValue<T> {
  void _showToastOnError(Toast toast) {
    if (!isRefreshing) {
      whenOrNull(
        error: (error, stackTrace) {
          toast.close();
          toast.showError(error.toString());
        },
      );
    }
  }

  void showToastOnError(Toast toast, {bool withMicrotask = false}) {
    if (withMicrotask) {
      Future.microtask(() => (this._showToastOnError(toast)));
    } else {
      this._showToastOnError(toast);
    }
  }

  T? valueOrToast(Toast toast, {bool withMicrotask = false}) =>
      (this..showToastOnError(toast, withMicrotask: withMicrotask)).valueOrNull;

  Widget showUiWhenData(
    Widget Function(T data) data, {
    void Function()? refresh,
    Widget Function(Widget)? wrapper,
    bool showGenericError = false,
  }) {
    return when(
      data: data,
      error: (error, trace) => wrapper == null
          ? Emoticons(
              text: showGenericError
                  ? LocaleKeys.error_somethingWentWrong.tr()
                  : error.toString(),
              button: refresh != null
                  ? TextButton(
                      onPressed: refresh,
                      child: Text(LocaleKeys.refresh.tr()),
                    )
                  : null,
            )
          : wrapper(
              Emoticons(
                text: showGenericError
                    ? LocaleKeys.error_somethingWentWrong.tr()
                    : error.toString(),
                button: refresh != null
                    ? TextButton(
                        onPressed: refresh,
                        child: Text(LocaleKeys.refresh.tr()),
                      )
                    : null,
              ),
            ),
      loading: () => wrapper == null
          ? const CenterCircularProgressIndicator()
          : wrapper(const CenterCircularProgressIndicator()),
    );
  }

  AsyncValue<U> copyWithData<U>(U Function(T) data) => when(
        data: (prev) => AsyncData(data(prev)),
        error: (error, stackTrace) => AsyncError<U>(error, stackTrace),
        loading: () => AsyncLoading<U>(),
      );
}
