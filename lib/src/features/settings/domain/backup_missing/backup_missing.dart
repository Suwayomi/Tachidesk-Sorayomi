// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';

part 'backup_missing.freezed.dart';
part 'backup_missing.g.dart';

@freezed
class BackupMissing with _$BackupMissing {
  BackupMissing._();
  factory BackupMissing({
    List<String>? missingSources,
    List<String>? missingTrackers,
  }) = _BackupMissing;

  BackupMissing get filter => BackupMissing(
        missingSources: [...?missingSources]
          ..removeWhere((element) => element.isBlank),
        missingTrackers: [...?missingTrackers]
          ..removeWhere((element) => element.isBlank),
      );
  bool get isNotEmpty =>
      missingSources.isNotBlank && missingTrackers.isNotBlank;

  factory BackupMissing.fromJson(Map<String, dynamic> json) =>
      _$BackupMissingFromJson(json);
}
