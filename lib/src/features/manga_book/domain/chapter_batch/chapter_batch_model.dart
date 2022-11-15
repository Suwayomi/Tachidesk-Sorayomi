// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_batch_model.freezed.dart';
part 'chapter_batch_model.g.dart';

@freezed
class ChapterBatch with _$ChapterBatch {
  factory ChapterBatch({
    List<int>? chapterIds,
    ChapterChange? change,
  }) = _ChapterBatch;

  factory ChapterBatch.fromJson(Map<String, dynamic> json) =>
      _$ChapterBatchFromJson(json);
}

@freezed
class ChapterChange with _$ChapterChange {
  factory ChapterChange({
    bool? isRead,
    bool? isBookmarked,
    int? lastPageRead,
    bool? delete,
  }) = _ChapterChange;

  factory ChapterChange.fromJson(Map<String, dynamic> json) =>
      _$ChapterChangeFromJson(json);
}
