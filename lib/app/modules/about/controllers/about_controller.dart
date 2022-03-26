import 'package:get/get.dart';

import '../../../data/about_model.dart';
import '../repository/about_repository.dart';

class AboutController extends GetxController {
  final Rx<About?> _about = About().obs;
  final AboutRepository repository = AboutRepository();

  About? get about => _about.value;
  set about(About? about) => _about.value = about;

  @override
  void onReady() async {
    about = await repository.getAbout();
    super.onReady();
  }
}
