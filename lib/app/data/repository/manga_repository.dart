import '../manga_model.dart';
import '../providers/manga_provider.dart';

class MangaRepository {
  static final MangaProvider _mangaProvider = MangaProvider();

  static Future<Manga?> getManga(int id, {bool fetchFreshData = true}) =>
      _mangaProvider.getManga(id, fetchFreshData: fetchFreshData);
  static Future addMangaToLibrary(int id) =>
      _mangaProvider.addMangaToLibrary(id);
  static Future removeMangaFromLibrary(int id) =>
      _mangaProvider.removeMangaFromLibrary(id);
}
