import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../data/providers/extension_provider.dart';

class BrowseRepository {
  final ExtensionProvider _extensionProvider = Get.put(ExtensionProvider());

  Future<Response> installExtensionFile({
    required Uint8List bytefile,
    required String filename,
  }) =>
      _extensionProvider.installExtensionFile(
        bytefile: bytefile,
        filename: filename,
      );
}
