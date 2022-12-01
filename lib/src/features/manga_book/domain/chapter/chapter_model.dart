// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';
part 'chapter_model.g.dart';

@freezed
class Chapter with _$Chapter {
  factory Chapter({
    int? id,
    bool? bookmarked,
    int? chapterCount,
    double? chapterNumber,
    bool? downloaded,
    int? fetchedAt,
    int? index,
    int? lastPageRead,
    int? lastReadAt,
    int? mangaId,
    String? name,
    int? pageCount,
    bool? read,
    String? scanlator,
    int? uploadDate,
    String? url,
    Map<String, String>? meta,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
