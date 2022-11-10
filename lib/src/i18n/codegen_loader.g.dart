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
    "common": {
      "copyMsg": "\"{msg}\" Copied!",
      "cancel": "Cancel",
      "save": "Save",
      "close": "Close",
      "delete": "Delete",
      "create": "Create",
      "refresh": "Refresh",
      "search": "Search..."
    },
    "ThemeMode": {"system": "System", "dark": "Dark", "light": "Light"},
    "AuthType": {"none": "None", "basic": "Basic Auth"},
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
      "disabled": "Disabled",
      "edge": "Edge",
      "kindlish": "Kindle-ish",
      "lShaped": "L Shaped",
      "rightAndLeft": "Right and Left"
    },
    "aboutScreen": {
      "buildTime": "Build time",
      "channel": "Channel",
      "checkForUpdates": "Check for updates",
      "client": "Client",
      "clientVersion": "Client version",
      "discord": "Discord",
      "gitHub": "GitHub",
      "reddit": "Reddit",
      "noUpdatesAvailable": "You're using the latest version",
      "searchingForUpdates": "Searching for updates...",
      "server": "Server",
      "serverVersion": "Server version",
      "sorayomi": "Sorayomi",
      "whatsNew": "What's New?"
    },
    "appTitle": "Tachidesk Sorayomi",
    "appUpdate": {
      "close": "Close",
      "gitHub": "GitHub",
      "newUpdateAvailable": "New update available",
      "versionAvailable": "Version v{version} available!!"
    },
    "appearanceScreen": {"appTheme": "App Theme"},
    "backupSettings": {
      "create": {
        "subtitle": "Backup library as a Tachidesk backup",
        "title": "Create Backup"
      },
      "restore": {
        "subtitle": "Restore Tachidesk from backup",
        "title": "Restore Backup"
      },
      "restored": {
        "subtitle": "Restored Tachidesk from backup",
        "title": "Backup restored!"
      },
      "restoring": {
        "subtitle": "Restoring Tachidesk from backup",
        "title": "Restoring backup..."
      },
      "missingExtension": "Missing Extensions",
      "missingTrackers": "Missing Trackers"
    },
    "browserScreen": {
      "SourceSearch": "Search..",
      "mangaSearch": "Global search.."
    },
    "browserSettingsScreen": {
      "nsfw": {
        "info":
            "This does not prevent unofficial or potentially incorrectly flagged extensions from surfacing NSFW(18+) content within app",
        "subtitle": "Requires app Restart or Reload",
        "title": "Show NSFW extensions and sources"
      }
    },
    "downloadScreen": {
      "pause": "Pause",
      "resume": "Resume",
      "noDownloads": "No Downloads"
    },
    "editCategoriesScreen": {
      "add": "Add",
      "addCategory": "Add Category",
      "defaultCategory": "Default category when adding new manga to library",
      "deleteCategory": {
        "title": "Are you sure?",
        "content": "This will delete all Mangas in this Category!"
      },
      "editCategory": "Edit Category",
      "name": "Category Name",
      "emptyCategory":
          "You have no Categories. Tap the Plus button to create one for organizing your library"
    },
    "error": {
      "somethingWentWrong": "Something went wrong!",
      "filePick": "File not selected!",
      "filePickUnknownExtension":
          "Please select a file with {extensionName} extension",
      "installedExtensionFile": "Failed to Install! Please try again",
      "invalidURL": "Invalid URL",
      "launchURL": "Failed to open!\nCopying \"{url}\" to clipboard",
      "restoreBackup": "Failed to Restore backup!\nPlease try again",
      "userName": "User Name can't be empty",
      "password": "Password can't be empty",
      "extension": "Can't find the selected extension"
    },
    "extensionScreen": {
      "extensionInstalled": {
        "subtitle": "Extension Installed successfully",
        "title": "Extension Installed!"
      },
      "extensionsError": "Extensions to Install",
      "install": "Install",
      "installing": "Installing",
      "installFile": {
        "subtitle": "Installing Tachidesk Extension",
        "title": "Installing Extension..."
      },
      "nsfw": "18+",
      "reload": "Reload!",
      "uninstall": "Uninstall",
      "update": "Update",
      "updating": "Updating",
      "uninstalling": "Uninstalling",
      "extensionListEmpty": "Extension list is Empty"
    },
    "globalSearchScreen": {
      "globalSearch": "Global Search",
      "searchGlobally": "Search Globally"
    },
    "libraryScreen": {
      "filter": "Filter",
      "filterCompleted": "Completed",
      "filterDownloaded": "Downloaded",
      "filterUnread": "Unread",
      "manga": "Manga",
      "mangaSearch": "Search manga..",
      "refresh": "Refresh",
      "sort": "Sort",
      "sortId": "Id",
      "sortInLibraryAt": "In Library",
      "sortTitle": "Title",
      "sortUnread": "Unread"
    },
    "loading": "Loading",
    "mangaGridDesign": {"inLibrary": "In library"},
    "mangaScreen": {
      "addCategoryHint": "Add new categories in settings",
      "addToLibrary": "Add to Library",
      "artist": "Artist",
      "author": "Author",
      "category": "Category",
      "chapterList": {
        "bookmark": "Bookmark",
        "markAsRead": "Mark as read",
        "markAsUnread": "Mark as unread",
        "markPrevAsRead": "Mark previous as read",
        "markPrevAsUnread": "Mark previous as unread",
        "removeBookmark": "Remove bookmark"
      },
      "chapters": "Chapters",
      "filter": "Filter",
      "filterBookmarked": "Bookmarked",
      "filterDownloaded": "Downloaded",
      "filterUnread": "Unread",
      "inLibrary": "In library",
      "manga": "Manga",
      "noChapter": "chapter found",
      "noNewChapter": "No new chapter",
      "reload": "Reload",
      "setAsDefault": "Set as default",
      "sort": "Sort",
      "sortFetchedAt": "Fetched date",
      "sortScanlator": "Scanlator",
      "sortSource": "Source",
      "source": "Source",
      "status": "Status",
      "unknown": "Unknown",
      "webView": "WebView"
    },
    "no": "No",
    "readerScreen": {
      "chapter": "Chapter",
      "chapterError": "Chapter to Load",
      "image": "Image",
      "manga": "Manga",
      "nextChapter": "Next Chapter",
      "previousChapter": "Previous Chapter",
      "readerMode": "Reading Mode",
      "readerNavigationLayoutInvert": "Invert tapping",
      "readerNavigationLayout_": "Navigation layout",
      "reload": "Reload!",
      "savedImagePathTitle": "Image path saved to Clipboard"
    },
    "readerSettingsScreen": {
      "category": "Category",
      "readerMode": "Reading Mode",
      "readerNavigationLayout": "Navigation layout",
      "readerNavigationLayoutInvert": "Invert tapping"
    },
    "screenTitle": {
      "about": "About",
      "browse": "Browse",
      "categories": "Categories",
      "downloads": "Downloads",
      "extensions": "Extensions",
      "library": "Library",
      "more": "More",
      "readerSettingsView": "Reader Settings",
      "settings": "Settings",
      "sources": "Sources",
      "updates": "Updates"
    },
    "searchManga": {
      "noMangaFound": "No Manga Found",
      "search": "Search",
      "searchManga": "Search manga.."
    },
    "serverSettingsScreen": {
      "baseAuthType": "Authentication Type",
      "password": "Password",
      "save": "Save",
      "url": "Server URL",
      "hintText": "Enter server url",
      "userName": "User Name",
      "webUI": "Open in WEB",
      "credentials": "Credentials"
    },
    "settingsScreen": {
      "appearance": "Appearance",
      "backup": "Backup & Restore",
      "browse": "Browse",
      "general": "General",
      "library": "Library",
      "reader": "Reader",
      "server": "Server",
      "help": "Help"
    },
    "sourceMangaScreen": {
      "browse": "Browse manga",
      "filter": "Filter",
      "latest": "Latest manga",
      "loading": "Loading!",
      "manga": "Manga",
      "reload": "Reload!",
      "reset": "Reset"
    },
    "sourceScreen": {
      "browse": "Browse",
      "close": "Close",
      "extensions": "Installed Extensions",
      "languages": "Languages",
      "latest": "Latest",
      "reload": "Reload!",
      "search": "Search",
      "sourceListEmpty": "Sources list is Empty"
    }
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"en_US": en_US};
}
