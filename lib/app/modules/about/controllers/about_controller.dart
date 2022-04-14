import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/about_model.dart';
import '../../../data/services/local_storage_service.dart';
import '../../../widgets/app_update_dialog.dart';
import '../repository/about_repository.dart';

class AboutController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  final Rx<About?> _about = About().obs;
  final AboutRepository repository = AboutRepository();

  PackageInfo? packageInfo;
  About? get about => _about.value;
  set about(About? about) => _about.value = about;

  String? get version => packageInfo?.version;
  String? get buildNumber => packageInfo?.buildNumber;

  Future<void> checkUpdate() async {
    Get.rawSnackbar(message: LocaleKeys.aboutScreen_searchingForUpdates.tr);

    Version? newRelease = await localStorageService.checkUpdate();
    Get.closeAllSnackbars();
    if (newRelease != null) {
      appUpdateDialog(newRelease);
    } else {
      Get.rawSnackbar(message: LocaleKeys.aboutScreen_noUpdatesAvailable.tr);
    }
  }

  @override
  void onReady() async {
    packageInfo = await PackageInfo.fromPlatform();
    about = await repository.getAbout();
    super.onReady();
  }
}
