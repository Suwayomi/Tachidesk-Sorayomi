import 'package:get/get.dart';

import '../../../data/about_model.dart';
import '../../../data/repository/about_repository.dart';

class AboutController extends GetxController {
  final AboutRepository _aboutRepository = AboutRepository();
  final Rx<About?> _about = About().obs;

  About? get getAbout => _about.value;
  set setAbout(About? about) => _about.value = about;

  @override
  void onReady() async {
    setAbout = await _aboutRepository.getAbout();
    super.onReady();
  }
}
