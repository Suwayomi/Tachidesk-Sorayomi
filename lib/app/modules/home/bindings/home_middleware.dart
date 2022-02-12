import 'package:get/get.dart';
import 'package:tachidesk_flutter/app/data/repository/about_repository.dart';
import 'package:tachidesk_flutter/app/routes/app_pages.dart';

class HomeEnsureServerMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // you can do whatever you want here
    // but it's preferable to make this method fast
    // await Future.delayed(Duration(milliseconds: 500));

    try {
      await AboutRepository.getAbout();
    } catch (e) {
      return GetNavConfig.fromRoute(Routes.serverSettings);
    }
    return await super.redirectDelegate(route);
  }
}
