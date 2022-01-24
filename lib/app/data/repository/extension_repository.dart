import 'dart:io';

import '../extension_model.dart';
import '../providers/extension_provider.dart';

class ExtensionRepository {
  final ExtensionProvider _extensionProvider = ExtensionProvider();

  Future<List<Extension>?> getExtensionList() => _extensionProvider.getExtensionList();
  Future installExtension(String pkgName) => _extensionProvider.installExtension(pkgName);
  Future updateExtension(String pkgName) => _extensionProvider.updateExtension(pkgName);
  Future uninstallExtension(String pkgName) => _extensionProvider.uninstallExtension(pkgName);
  Future installExtensionFile(File file) => _extensionProvider.installExtensionFile(file);
}
