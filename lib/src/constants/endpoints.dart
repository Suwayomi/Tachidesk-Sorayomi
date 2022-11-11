// 🌎 Project imports:
import 'db_keys.dart';

abstract class Endpoints {
  // base url
  static String baseApi({String? baseUrl}) =>
      "${baseUrl ?? DBKeys.serverUrl.initial}/api/v1";

  // receiveTimeout
  static const int receiveTimeout = 10000;

  // connectTimeout
  static const int connectionTimeout = 10000;
}

abstract class SettingsUrl {
  static const String about = '$_settings/about';
  static const String checkServerUpdate = '$_settings/check-update';
  static const String _settings = "/settings";
}

abstract class ExtensionUrl {
  static const String _extension = "/extension";
  static const String list = "$_extension/list";
  static const String installFile = "$_extension/install";
  static String installPkg(String pkgName) => "$installFile/$pkgName";
  static String updatePkg(String pkgName) => "$_extension/update/$pkgName";
  static String uninstallPkg(String pkgName) =>
      "$_extension/uninstall/$pkgName";
  static String icon(String apkName) => "$_extension/icon/$apkName";
}

abstract class CategoryUrl {
  static const String category = "/category";
  static const String reorder = "$category/reorder";
  static String withId(int id) => "$category/$id";
}

abstract class MangaUrl {
  static String withId(int mangaId) => "$_manga/$mangaId";
  static String thumbnail(int mangaId) => "$_manga/$mangaId/thumbnail";
  static String category(int mangaId) => "$_manga/$mangaId/category";
  static String categoryId(int mangaId, int categoryId) =>
      "$_manga/$mangaId/category/$categoryId";
  static String library(int mangaId) => "$_manga/$mangaId/library";
  static String meta(int mangaId) => "$_manga/$mangaId/meta";
  static String chapters(int mangaId) => "$_manga/$mangaId/chapters";
  static String chapterWithIndex(int mangaId, int chapterIndex,
          {bool useCache = true}) =>
      "$_manga/$mangaId/chapter/$chapterIndex?useCache=$useCache";
  static String chapterMetaWithIndex(int mangaId, int chapterIndex) =>
      "$_manga/$mangaId/chapter/$chapterIndex/meta";
  static String chapterPageWithIndex({
    required int mangaId,
    required int chapterIndex,
    required int pageIndex,
    required bool useCache,
  }) =>
      "$_manga/$mangaId/chapter/$chapterIndex/page/$pageIndex?useCache=$useCache";

  static const String _manga = "/manga";
}

abstract class DownloaderUrl {
  static String start = "$downloads/start";
  static String stop = "$downloads/stop";
  static String clear = "$downloads/clear";

  static String batch = "/download/batch";
  static String chapter(int mangaId, int chapterIndex) =>
      "/download/$mangaId/chapter/$chapterIndex";

  static const String downloads = "/downloads";
}

abstract class BackupUrl {
  static String import = "$_backup/import/file";
  static String validate = "$_backup/validate/file";
  static String export = "$_backup/export/file";

  static const String _backup = "/backup";
}

abstract class SourceUrl {
  static String sourceList = "$_source/list";

  static String withId(String sourceId) => "$_source/$sourceId";
  static String popular(String sourceId, int pageNum) =>
      "$_source/$sourceId/popular/$pageNum";
  static String latest(String sourceId, int pageNum) =>
      "$_source/$sourceId/latest/$pageNum";
  static String preferences(String sourceId) =>
      "$_source/$sourceId/preferences";
  static String filters(String sourceId) => "$_source/$sourceId/filters";
  static String search(String sourceId) => "$_source/$sourceId/search";

  static const String _source = "/source";
}

abstract class UpdateUrl {
  static String recentChapters(int pageNo) => "$_update/recentChapters/$pageNo";

  static const String _update = "/update";
}
