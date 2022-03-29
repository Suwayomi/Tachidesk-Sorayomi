import 'package:get/get.dart';

import '../../data/enums/auth_type.dart';
import '../../data/services/local_storage_service.dart';

Map<String, String> authHeader(AuthType authtype) {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  switch (authtype) {
    case AuthType.none:
      return {};
    case AuthType.basic:
      return {'authorization': localStorageService.basicAuth};
    default:
  }
  return {};
}
