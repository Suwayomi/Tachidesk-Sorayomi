// test/src/features/manga_book/domain/chapter/chapter_download_presets_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:tachidesk_sorayomi/src/features/manga_book/domain/chapter/chapter_download_presets.dart';

ChapterDownloadCandidate _ch(
  int id,
  double chapterNumber, {
  bool isRead = false,
  bool isDownloaded = false,
}) =>
    ChapterDownloadCandidate(
      id: id,
      chapterNumber: chapterNumber,
      isRead: isRead,
      isDownloaded: isDownloaded,
    );

void main() {
  group('chaptersToQueueForPreset', () {
    test('nextChapter returns first non-downloaded chapter after read position', () {
      final result = chaptersToQueueForPreset([
        _ch(101, 1, isRead: true),
        _ch(102, 2, isRead: true),
        _ch(103, 3),
        _ch(104, 4),
      ], DownloadPreset.nextChapter);
      expect(result, [103]);
    });

    test('nextChapter skips already-downloaded', () {
      final result = chaptersToQueueForPreset([
        _ch(101, 1, isRead: true),
        _ch(102, 2, isDownloaded: true),
        _ch(103, 3),
      ], DownloadPreset.nextChapter);
      expect(result, [103]);
    });

    test('nextChapter starts at lowest chapter when nothing is read', () {
      final result = chaptersToQueueForPreset([
        _ch(105, 5),
        _ch(101, 1),
        _ch(103, 3),
      ], DownloadPreset.nextChapter);
      expect(result, [101]);
    });

    test('next5 takes 5 non-downloaded chapters after read position', () {
      final result = chaptersToQueueForPreset([
        for (var i = 1; i <= 10; i++) _ch(100 + i, i.toDouble())
      ], DownloadPreset.next5);
      expect(result, [101, 102, 103, 104, 105]);
    });

    test('next5 starts after the last read chapter', () {
      final result = chaptersToQueueForPreset([
        _ch(101, 1, isRead: true),
        _ch(102, 2, isRead: true),
        _ch(103, 3),
        _ch(104, 4),
        _ch(105, 5),
      ], DownloadPreset.next5);
      expect(result, [103, 104, 105]);
    });

    test('next5 walks past already-downloaded to collect 5 new IDs', () {
      final result = chaptersToQueueForPreset([
        for (var i = 1; i <= 8; i++)
          _ch(100 + i, i.toDouble(), isDownloaded: i.isEven),
      ], DownloadPreset.next5);
      // odd-numbered chapters only: 1,3,5,7 — only 4 available, expect those 4
      expect(result, [101, 103, 105, 107]);
    });

    test('next5 returns fewer than 5 if not enough chapters', () {
      final result = chaptersToQueueForPreset([
        _ch(101, 1),
        _ch(102, 2),
      ], DownloadPreset.next5);
      expect(result, [101, 102]);
    });

    test('next10 / next25 use the right N', () {
      final ten = chaptersToQueueForPreset([
        for (var i = 1; i <= 30; i++) _ch(100 + i, i.toDouble())
      ], DownloadPreset.next10);
      expect(ten.length, 10);
      expect(ten.first, 101);
      expect(ten.last, 110);

      final twentyFive = chaptersToQueueForPreset([
        for (var i = 1; i <= 30; i++) _ch(100 + i, i.toDouble())
      ], DownloadPreset.next25);
      expect(twentyFive.length, 25);
      expect(twentyFive.last, 125);
    });

    test('unread returns all not-read non-downloaded chapters ascending', () {
      final result = chaptersToQueueForPreset([
        _ch(101, 1, isRead: true),
        _ch(102, 2),
        _ch(103, 3, isDownloaded: true),
        _ch(104, 4),
      ], DownloadPreset.unread);
      expect(result, [102, 104]);
    });

    test('unread treats partially-read chapters as unread (strict semantics)', () {
      // The candidate type only carries isRead; partial-read distinction does
      // not exist at this layer — the caller is responsible for not flipping
      // isRead until the user finishes the chapter. The helper takes isRead
      // at face value.
      final result = chaptersToQueueForPreset([
        _ch(101, 1, isRead: false), // partially-read at the source — still unread to us
        _ch(102, 2, isRead: true),
      ], DownloadPreset.unread);
      expect(result, [101]);
    });

    test('all returns every non-downloaded chapter ascending, regardless of read state', () {
      final result = chaptersToQueueForPreset([
        _ch(101, 1, isRead: true),
        _ch(102, 2),
        _ch(103, 3, isDownloaded: true),
      ], DownloadPreset.all);
      expect(result, [101, 102]);
    });

    test('result is sorted by chapterNumber, not input order', () {
      final result = chaptersToQueueForPreset([
        _ch(105, 5),
        _ch(101, 1),
        _ch(103, 3),
      ], DownloadPreset.all);
      expect(result, [101, 103, 105]);
    });

    test('empty input returns empty list', () {
      final result = chaptersToQueueForPreset([], DownloadPreset.all);
      expect(result, isEmpty);
    });

    test('all chapters already downloaded returns empty list', () {
      final result = chaptersToQueueForPreset([
        _ch(101, 1, isDownloaded: true),
        _ch(102, 2, isDownloaded: true),
      ], DownloadPreset.all);
      expect(result, isEmpty);
    });

    test('decimal chapter numbers (e.g., 1.5) sort correctly', () {
      final result = chaptersToQueueForPreset([
        _ch(102, 2),
        _ch(115, 1.5),
        _ch(101, 1),
      ], DownloadPreset.next5);
      expect(result, [101, 115, 102]);
    });
  });
}
