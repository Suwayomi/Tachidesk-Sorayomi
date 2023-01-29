// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en_US = {
    "AuthType": {"basic": "Basic Auth", "none": "None"},
    "ChapterSort": {"fetchedDate": "By Fetched Data", "source": "By Source"},
    "DisplayMode": {
      "descriptiveList": "Descriptive List",
      "grid": "Grid",
      "list": "List"
    },
    "MangaSort": {
      "alphabetical": "Alphabetical",
      "dateAdded": "Date Added",
      "unread": "Unread"
    },
    "MangaStatus": {
      "cancelled": "Cancelled",
      "completed": "Completed",
      "licensed": "Licensed",
      "onHiatus": "On Hiatus",
      "ongoing": "Ongoing",
      "publishingFinished": "Publishing Finished",
      "unknown": "Unknown"
    },
    "ReaderMode": {
      "continuousHorizontalLTR": "Continuous Horizontal (LTR)",
      "continuousHorizontalRTL": "Continuous Horizontal (RTL)",
      "continuousVertical": "Continuous Vertical",
      "defaultReader": "Default",
      "singleHorizontalLTR": "Single Horizontal (LTR)",
      "singleHorizontalRTL": "Single Horizontal (RTL)",
      "singleVertical": "Single Vertical",
      "webtoon": "Webtoon"
    },
    "ReaderNavigationLayout": {
      "defaultNavigation": "Default",
      "disabled": "Disabled",
      "edge": "Edge",
      "kindlish": "Kindle-ish",
      "lShaped": "L Shaped",
      "rightAndLeft": "Right and Left"
    },
    "SourceType": {
      "filter": "Filter",
      "latest": "Latest",
      "popular": "Popular"
    },
    "ThemeMode": {"dark": "Dark", "light": "Light", "system": "System"},
    "about": "About",
    "add": "Add",
    "addCategory": "Add Category",
    "addToLibrary": "Add to Library",
    "appTheme": "App Theme",
    "appTitle": "Tachidesk Sorayomi",
    "appearance": "Appearance",
    "backup": "Backup & Restore",
    "badges": "Badges",
    "baseAuthType": "Authentication Type",
    "bookmarked": "Bookmarked",
    "browse": "Browse",
    "buildTime": "Build time",
    "cancel": "Cancel",
    "categories": "Categories",
    "category": "Category",
    "categoryUpdate": "Category Update",
    "channel": "Channel",
    "chapterNumber": "Chapter {number}",
    "checkForServerUpdates": "Check for Server updates",
    "checkForUpdates": "Check for updates",
    "client": "Client",
    "clientVersion": "Client version",
    "close": "Close",
    "completed": "Completed",
    "copyMsg": "\"{msg}\" Copied!",
    "create": "Create",
    "createBackup": {
      "subtitle": "Backup library as a Tachidesk backup",
      "title": "Create Backup"
    },
    "credentials": "Credentials",
    "current": "Current",
    "defaultCategory": "Default category when adding new manga to library",
    "delete": "Delete",
    "deleteCategory": {
      "content": "This will merge all Mangas in this Category to Default!",
      "title": "Are you sure?"
    },
    "discord": "Discord",
    "display": "Display",
    "displayMode": "Display Mode",
    "downloaded": "Downloaded",
    "downloads": "Downloads",
    "edit": "Edit",
    "editCategory": "Edit Category",
    "emptyCategory": "Category name can't be Empty",
    "error": {
      "extension": "Can't find the selected extension",
      "filePick": "File not selected!",
      "filePickUnknownExtension":
          "Please select a file with {extensionName} extension",
      "installedExtensionFile": "Failed to Install! Please try again",
      "invalidURL": "Invalid URL",
      "launchURL": "Failed to open!\nCopying \"{url}\" to clipboard",
      "password": "Password can't be empty",
      "restoreBackup": "Failed to Restore backup!\nPlease try again",
      "somethingWentWrong": "Something went wrong!",
      "userName": "User Name can't be empty"
    },
    "extensionInstalled": "Extension Installed!",
    "extensionListEmpty": "Extension list is Empty",
    "extensions": "Extensions",
    "failed": "Failed",
    "filter": "Filter",
    "finished": "Finished",
    "gitHub": "GitHub",
    "globalSearch": "Global Search",
    "globalUpdate": "Global Update",
    "help": "Help",
    "inLibrary": "In library",
    "install": "Install",
    "installing": "Installing",
    "installingExtension": "Installing Extension...",
    "languages": "Languages",
    "latest": "Latest",
    "library": "Library",
    "manga": "Manga",
    "mangaMissingSources": "Manga Missing Sources",
    "missingExtension": "Missing Extensions",
    "missingTrackers": "Missing Trackers",
    "more": "More",
    "newUpdateAvailable": "New update available",
    "noCategoriesFound":
        "You don't have any Categories. \nTap the Plus button to create one for organizing your library",
    "noCategoriesFoundAlt":
        "You don't have any Categories. \nCreate one in settings for organizing your library",
    "noCategoryMangaFound":
        "No manga found in this Category. \n(Tip: Check your search & filters!)",
    "noChaptersFound": "No Chapters found",
    "noDownloads": "No Downloads",
    "noMangaFound": "No Mangas Found",
    "noOfChapters": "{count} Chapters",
    "noResultFound": "No results found",
    "noSourcesFound": "No sources found",
    "noUpdatesAvailable": "You're using the latest version",
    "noUpdatesFound": "No updates found",
    "nsfw": {
      "info":
          "This does not prevent unofficial or potentially incorrectly flagged extensions from surfacing NSFW(18+) content within app",
      "subtitle": "Requires app Restart or Reload",
      "title": "Show NSFW extensions and sources"
    },
    "nsfw18": "18+",
    "numSelected": "{num} Selected",
    "page": "Page: {number}",
    "password": "Password",
    "pause": "Pause",
    "pending": "Pending",
    "reader": "Reader",
    "readerMode": "Reading Mode",
    "readerNavigationLayout": "Navigation layout",
    "readerNavigationLayoutInvert": "Invert tapping",
    "reddit": "Reddit",
    "refresh": "Refresh",
    "reset": "Reset",
    "restore": {
      "subtitle": "Restore Tachidesk from backup",
      "title": "Restore Backup"
    },
    "restored": "Backup restored!",
    "restoring": "Restoring backup...",
    "resume": "Resume",
    "retry": "Retry",
    "running": "Running",
    "save": "Save",
    "search": "Search...",
    "searchingForUpdates": "Searching for updates...",
    "server": "Server",
    "serverVersion": "Server version",
    "settings": "Settings",
    "sort": "Sort",
    "source": "Source",
    "sources": "Sources",
    "start": "Start",
    "uninstall": "Uninstall",
    "uninstalling": "Uninstalling",
    "unknown": "Unknown",
    "unknownAuthor": "Unknown Author",
    "unknownManga": "Unknown Manga",
    "unknownSource": "Unknown Source",
    "unread": "Unread",
    "update": "Update",
    "updateCompleted": "Update Completed",
    "updates": "Updates",
    "updatesSummary": "Updates Summary",
    "updating": "Updating",
    "url": "Server URL",
    "urlHintText": "Enter server url",
    "userName": "User Name",
    "versionAvailable": "Version {version} available for {app}!!",
    "webUI": "Open in WEB",
    "webView": "WebView",
    "whatsNew": "What's New?"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"en_US": en_US};
}
