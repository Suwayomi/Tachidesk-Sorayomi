import 'package:get/get.dart';

import '../../../data/about_model.dart';
import '../../../data/providers/about_provider.dart';

class AboutRepository {
  final AboutProvider _aboutProvider = Get.put(AboutProvider());

  Future<About?> getAbout() => _aboutProvider.getAbout();
}
