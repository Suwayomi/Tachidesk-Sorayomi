import 'package:get/get.dart';

import '../../../data/extension_model.dart';
import '../../../data/providers/extension_provider.dart';

class ExtensionRepository {
  final ExtensionProvider _extensionProvider = Get.put(ExtensionProvider());
  Future<List<Extension>?> getExtensionList() =>
      _extensionProvider.getExtensionList();
  Future<Response> installExtension(String pkgName) =>
      _extensionProvider.installExtension(pkgName);
  Future<Response> updateExtension(String pkgName) =>
      _extensionProvider.updateExtension(pkgName);
  Future<Response> uninstallExtension(String pkgName) =>
      _extensionProvider.uninstallExtension(pkgName);
}
