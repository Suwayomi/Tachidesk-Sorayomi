import '../manga_model.dart';
import '../providers/manga_provider.dart';

class MangaRepository {
  final MangaProvider _mangaProvider = MangaProvider();

  Future<Manga?> getManga(int id, {bool fetchFreshData = true}) =>
      _mangaProvider.getManga(id, fetchFreshData: fetchFreshData);
  Future addMangaToLibrary(int id) => _mangaProvider.addMangaToLibrary(id);
  Future removeMangaFromLibrary(int id) =>
      _mangaProvider.removeMangaFromLibrary(id);
}
