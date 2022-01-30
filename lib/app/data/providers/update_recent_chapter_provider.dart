import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';

class UpdateRecentChapterProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<dynamic> getUpdateRecentChapter(int id) async {
    final response = await get(
        _localStorageService.baseURL + updateRecentChapterUrl + '/$id');
    return response.body;
  }

  // Future<Response<UpdateRecentChapter>> postUpdateRecentChapter(
  //         UpdateRecentChapter updaterecentchapter) async =>
  //     await post('updaterecentchapter', updaterecentchapter);
  // Future<Response> deleteUpdateRecentChapter(int id) async =>
  //     await delete('updaterecentchapter/$id');
}
