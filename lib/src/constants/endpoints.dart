import 'db_keys.dart';

abstract class Endpoints {
  // base url
  static String baseApi({String? baseUrl}) =>
      "${baseUrl ?? DBKeys.serverUrl.initial}/api/v1";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 5000;
}

abstract class SettingsUrl {
  static const String about = '$_settings/about';
  static const String _settings = "/settings";
}

abstract class ExtensionUrl {
  static String extensionList = "$_extension/list";
  static String extensionInstall = "$_extension/install";
  static String extensionInstallPkgName(String pkgName) =>
      "$_extension/install/$pkgName";
  static String extensionUpdate(String pkgName) =>
      "$_extension/update/$pkgName";
  static String extensionUninstall(String pkgName) =>
      "$_extension/uninstall/$pkgName";
  static String extensionIcon(String apkName) => "$_extension/icon/$apkName";
  static const String _extension = "/extension";
}

abstract class CategoryUrl {
  static String reorder = "$_category/reorder";
  static String category = _category;

  static String withId(int id) => "$_category/$id";

  static const String _category = "/category";
}

abstract class MangaUrl {
  static String getMangaId(int mangaId) => "$_manga/$mangaId";
  static String getMangaThumbnail(int mangaId) => "$_manga/$mangaId/thumbnail";
  static String getMangaCategory(int mangaId) => "$_manga/$mangaId/category";
  static String getMangaCategoryId(int mangaId, int categoryId) =>
      "$_manga/$mangaId/category/$categoryId";
  static String getMangaLibrary(int mangaId) => "$_manga/$mangaId/library";
  static String getMangaMeta(int mangaId) => "$_manga/$mangaId/meta";
  static String getMangaChapters(int mangaId) => "$_manga/$mangaId/chapters";
  static String getMangaChapterIndex(int mangaId, int chapterIndex) =>
      "$_manga/$mangaId/chapter/$chapterIndex";
  static String getMangaChapterIndexMeta(int mangaId, int chapterIndex) =>
      "$_manga/$mangaId/chapter/$chapterIndex/meta";
  static String getMangaChapterIndexPage({
    required int mangaId,
    required int chapterIndex,
    required int pageIndex,
    required bool useCache,
  }) =>
      "$_manga/$mangaId/chapter/$chapterIndex/page/$pageIndex?useCache=$useCache";

  static const String _manga = "/manga";
}

abstract class DownloaderUrl {
  static String start = "$_downloads/start";
  static String stop = "$_downloads/stop";
  static String clear = "$_downloads/clear";

  static String chapter(int mangaId, int chapterIndex) =>
      "/download/$mangaId/chapter/$chapterIndex";

  static const String _downloads = "/downloads";
}

abstract class BackupUrl {
  static String import = "$_backup/import/file";
  static String validate = "$_backup/validate/file";
  static String export = "$_backup/export/file";

  static const String _backup = "/backup";
}

abstract class SourceUrl {
  static String sourceList = "$_source/list";

  static String getSourceId(String sourceId) => "$_source/$sourceId";
  static String getSourceByPopular(String sourceId, int pageNum) =>
      "$_source/$sourceId/popular/$pageNum";
  static String getSourceByLatest(String sourceId, int pageNum) =>
      "$_source/$sourceId/latest/$pageNum";
  static String getSourcePreferences(String sourceId) =>
      "$_source/$sourceId/preferences";
  static String getSourceFilters(String sourceId) =>
      "$_source/$sourceId/filters";
  static String getSourceSearch(String sourceId) => "$_source/$sourceId/search";

  static const String _source = "/source";
}

abstract class UpdateUrl {
  static String recentChapters = "$_update/recentChapters";

  static const String _update = "/update";
}
