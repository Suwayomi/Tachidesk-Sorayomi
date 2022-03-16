import 'dart:convert';

import 'package:tachidesk_sorayomi/app/data/manga_model.dart';

class MangaFilter {
  bool? filterUnread;
  bool? filterCompleted;
  bool? filterDownloaded;
  bool? _sortTitle;
  bool? _sortInLibraryAt;
  bool? _sortUnread;

  MangaFilter({
    this.filterUnread,
    this.filterCompleted,
    this.filterDownloaded,
    bool? sortTitle,
    bool? sortInLibraryAt,
    bool? sortUnread,
  })  : assert((sortTitle != null) ^
            (sortInLibraryAt != null) ^
            (sortUnread!= null)),
        assert(!((sortTitle != null) &
            (sortInLibraryAt != null) &
            (sortUnread != null))),
        _sortTitle = sortTitle,
        _sortInLibraryAt = sortInLibraryAt,
        _sortUnread = sortUnread;

  get sortTitle => _sortTitle;
  get sortInLibraryAt => _sortInLibraryAt;
  get sortUnread => _sortUnread;

  void toggleSortTitle() {
    if (_sortTitle != null) {
      _sortTitle = !_sortTitle!;
    } else {
      _sortInLibraryAt = null;
      _sortUnread = null;
      _sortTitle = true;
    }
  }

  void toggleSortUnread() {
    if (_sortUnread != null) {
      _sortUnread = !_sortUnread!;
    } else {
      _sortInLibraryAt = null;
      _sortUnread = true;
      _sortTitle = null;
    }
  }

  void toggleSortInLibraryAt() {
    if (_sortInLibraryAt != null) {
      _sortInLibraryAt = !_sortInLibraryAt!;
    } else {
      _sortInLibraryAt = true;
      _sortUnread = null;
      _sortTitle = null;
    }
  }

  bool applyFilter(Manga manga) {
    if (filterUnread != null) {
      return !(filterUnread! ^ ((manga.unreadCount ?? 0) > 0));
    }
    if (filterDownloaded != null) {
      return !(filterDownloaded! ^ ((manga.downloadCount ?? 0) > 0));
    }
    if (filterCompleted != null) {
      return !(filterCompleted! ^ ((manga.status ?? "") == "COMPLETED"));
    }
    return true;
  }

  int applySort(Manga m1, Manga m2) {
    if (_sortTitle != null) {
      return _sortTitle!
          ? (m1.title ?? "").compareTo(m2.title ?? "")
          : (m2.title ?? "").compareTo(m1.title ?? "");
    }
    if (_sortInLibraryAt != null) {
      return _sortInLibraryAt!
          ? (m1.inLibraryAt ?? 0).compareTo(m2.inLibraryAt ?? 0)
          : (m2.inLibraryAt ?? 0).compareTo(m1.inLibraryAt ?? 0);
    }
    if (_sortUnread != null) {
      return _sortUnread!
          ? (m1.unreadCount ?? 0).compareTo(m2.unreadCount ?? 0)
          : (m2.unreadCount ?? 0).compareTo(m1.unreadCount ?? 0);
    }

    return 0;
  }

  MangaFilter copyWith({
    bool? filterUnread,
    bool? filterCompleted,
    bool? filterDownloaded,
    bool? sortTitle,
    bool? sortInLibraryAt,
    bool? sortUnread,
  }) {
    return MangaFilter(
      filterUnread: filterUnread ?? this.filterUnread,
      filterCompleted: filterCompleted ?? this.filterCompleted,
      filterDownloaded: filterDownloaded ?? this.filterDownloaded,
      sortTitle: sortTitle ?? _sortTitle,
      sortInLibraryAt: sortInLibraryAt ?? _sortInLibraryAt,
      sortUnread: sortUnread ?? _sortUnread,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filterUnread': filterUnread,
      'filterCompleted': filterCompleted,
      'filterDownloaded': filterDownloaded,
      'sortTitle': _sortTitle,
      'sortInLibraryAt': _sortInLibraryAt,
      'sortUnread': _sortUnread,
    };
  }

  factory MangaFilter.fromMap(Map<String, dynamic> map) {
    return MangaFilter(
      filterUnread: map['filterUnread'],
      filterCompleted: map['filterCompleted'],
      filterDownloaded: map['filterDownloaded'],
      sortTitle: map['sortTitle'],
      sortInLibraryAt: map['sortInLibraryAt'],
      sortUnread: map['sortUnread'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MangaFilter.fromJson(String source) =>
      MangaFilter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MangaFilter('
        'filterUnread: $filterUnread, filterCompleted: $filterCompleted,'
        ' filterDownloaded: $filterDownloaded, _sortTitle: $_sortTitle,'
        ' _sortInLibraryAt: $_sortInLibraryAt, _sortUnread: $_sortUnread)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MangaFilter &&
        other.filterUnread == filterUnread &&
        other.filterCompleted == filterCompleted &&
        other.filterDownloaded == filterDownloaded &&
        other._sortTitle == _sortTitle &&
        other._sortInLibraryAt == _sortInLibraryAt &&
        other._sortUnread == _sortUnread;
  }

  @override
  int get hashCode {
    return filterUnread.hashCode ^
        filterCompleted.hashCode ^
        filterDownloaded.hashCode ^
        _sortTitle.hashCode ^
        _sortInLibraryAt.hashCode ^
        _sortUnread.hashCode;
  }
}
