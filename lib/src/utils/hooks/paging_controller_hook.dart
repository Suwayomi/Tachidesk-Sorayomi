// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// Creates [PagingController] that will be disposed automatically.
///
/// See also:
/// - [PagingController]
PagingController<PageKeyType, ItemType>
    usePagingController<PageKeyType, ItemType>(
        {required PageKeyType firstPageKey, int? invisibleItemsThreshold}) {
  return use<PagingController<PageKeyType, ItemType>>(
    _PagingControllerHook<PageKeyType, ItemType>(
      firstPageKey: firstPageKey,
      invisibleItemsThreshold: invisibleItemsThreshold,
    ),
  );
}

class _PagingControllerHook<PageKeyType, ItemType>
    extends Hook<PagingController<PageKeyType, ItemType>> {
  const _PagingControllerHook(
      {super.keys, required this.firstPageKey, this.invisibleItemsThreshold});

  final PageKeyType firstPageKey;
  final int? invisibleItemsThreshold;

  @override
  HookState<PagingController<PageKeyType, ItemType>,
          Hook<PagingController<PageKeyType, ItemType>>>
      createState() => _PagingControllerHookState<PageKeyType, ItemType>();
}

class _PagingControllerHookState<PageKeyType, ItemType> extends HookState<
    PagingController<PageKeyType, ItemType>,
    _PagingControllerHook<PageKeyType, ItemType>> {
  late final controller = PagingController<PageKeyType, ItemType>(
    firstPageKey: hook.firstPageKey,
    invisibleItemsThreshold: hook.invisibleItemsThreshold,
  );

  @override
  PagingController<PageKeyType, ItemType> build(BuildContext context) =>
      controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'usePagingController';
}
