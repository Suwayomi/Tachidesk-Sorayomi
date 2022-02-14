import 'dart:io';

import '../extension_model.dart';
import '../providers/extension_provider.dart';

class ExtensionRepository {
  static final ExtensionProvider _extensionProvider = ExtensionProvider();

  static Future<List<Extension>?> getExtensionList() =>
      _extensionProvider.getExtensionList();
  static Future installExtension(String pkgName) =>
      _extensionProvider.installExtension(pkgName);
  static Future updateExtension(String pkgName) =>
      _extensionProvider.updateExtension(pkgName);
  static Future uninstallExtension(String pkgName) =>
      _extensionProvider.uninstallExtension(pkgName);
  static Future installExtensionFile(File file) =>
      _extensionProvider.installExtensionFile(file);
}
