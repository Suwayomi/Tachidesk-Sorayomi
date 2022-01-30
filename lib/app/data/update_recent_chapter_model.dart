import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'manga_page_model.dart';

class UpdateRecentChapter {
  bool? hasNextPage;
  List<MangaPage>? pageList;
  UpdateRecentChapter({
    this.hasNextPage,
    this.pageList,
  });

  UpdateRecentChapter copyWith({
    bool? hasNextPage,
    List<MangaPage>? pageList,
  }) {
    return UpdateRecentChapter(
      hasNextPage: hasNextPage ?? this.hasNextPage,
      pageList: pageList ?? this.pageList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hasNextPage': hasNextPage,
      'page': pageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory UpdateRecentChapter.fromMap(Map<String, dynamic> map) {
    return UpdateRecentChapter(
      hasNextPage: map['hasNextPage'],
      pageList: map['page'] != null
          ? List<MangaPage>.from(map['page']?.map((x) => MangaPage.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateRecentChapter.fromJson(String source) =>
      UpdateRecentChapter.fromMap(json.decode(source));

  @override
  String toString() =>
      'UpdateRecentChapter(hasNextPage: $hasNextPage, page: $pageList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateRecentChapter &&
        other.hasNextPage == hasNextPage &&
        listEquals(other.pageList, pageList);
  }

  @override
  int get hashCode => hasNextPage.hashCode ^ pageList.hashCode;
}
