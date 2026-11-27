// lib/src/features/manga_book/domain/chapter/chapter_download_presets.dart

/// Lightweight value type the bulk-download menu's pure helper consumes.
/// Decoupled from `ChapterDto` so the helper is testable without GraphQL
/// codegen fixtures.
class ChapterDownloadCandidate {
  final int id;
  final double chapterNumber;
  final bool isRead;
  final bool isDownloaded;

  const ChapterDownloadCandidate({
    required this.id,
    required this.chapterNumber,
    required this.isRead,
    required this.isDownloaded,
  });
}

/// The six presets exposed by the manga-details bulk-download menu.
/// Order matches the menu display order (Komikku parity).
enum DownloadPreset {
  nextChapter,
  next5,
  next10,
  next25,
  unread,
  all,
}

/// Compute the list of chapter IDs to enqueue for a given preset.
///
/// Always operates on chapters sorted by `chapterNumber` ascending, regardless
/// of any UI display sort. "Next" semantics walk forward from the chapter
/// immediately after the highest-numbered chapter where `isRead == true`,
/// skipping any chapter that is already downloaded, until N IDs are collected
/// or the list is exhausted. "Unread" / "All" use simple filters.
List<int> chaptersToQueueForPreset(
  List<ChapterDownloadCandidate> chapters,
  DownloadPreset preset,
) {
  final sorted = [...chapters]
    ..sort((a, b) => a.chapterNumber.compareTo(b.chapterNumber));

  switch (preset) {
    case DownloadPreset.unread:
      return sorted
          .where((c) => !c.isRead && !c.isDownloaded)
          .map((c) => c.id)
          .toList();

    case DownloadPreset.all:
      return sorted
          .where((c) => !c.isDownloaded)
          .map((c) => c.id)
          .toList();

    case DownloadPreset.nextChapter:
    case DownloadPreset.next5:
    case DownloadPreset.next10:
    case DownloadPreset.next25:
      final n = switch (preset) {
        DownloadPreset.nextChapter => 1,
        DownloadPreset.next5 => 5,
        DownloadPreset.next10 => 10,
        DownloadPreset.next25 => 25,
        _ => 0,
      };

      final readChapters = sorted.where((c) => c.isRead);
      final readPosition = readChapters.isEmpty
          ? null
          : readChapters.last.chapterNumber;

      return sorted
          .where((c) =>
              readPosition == null || c.chapterNumber > readPosition)
          .where((c) => !c.isDownloaded)
          .take(n)
          .map((c) => c.id)
          .toList();
  }
}
