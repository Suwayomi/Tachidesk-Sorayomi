import 'dart:io';

import 'package:get/get.dart';

import '../../../data/providers/extension_provider.dart';

class BrowseRepository {
  final ExtensionProvider _extensionProvider = Get.put(ExtensionProvider());

  Future<Response> installExtensionFile(File pkgName) =>
      _extensionProvider.installExtensionFile(pkgName);
}
