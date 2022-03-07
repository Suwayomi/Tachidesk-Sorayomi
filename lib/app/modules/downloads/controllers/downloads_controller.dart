import 'package:get/get.dart';

import '../../../data/chapter_model.dart';
import '../../../data/download_queue_value_model.dart';
import '../../../data/downloads_model.dart';
import '../repository/downloads_repository.dart';

class DownloadsController extends GetxController {
  final DownloadsRepository repository = DownloadsRepository();
  late final GetSocket downloadSocket;
  final Rx<Downloads> _downloadsList =
      Downloads(queue: <DownloadQueueValue>[]).obs;

  Rx<Downloads> get downloadsListObs => _downloadsList;
  Downloads get downloadsList => _downloadsList.value;
  set downloadsList(Downloads value) => _downloadsList.value = value;
  void deleteFromDownloadQueue(DownloadQueueValue downloadQueueValue) async {
    await repository.deleteFromDownloadQueue(
      Chapter(
        mangaId: downloadQueueValue.mangaId,
        index: downloadQueueValue.chapterIndex,
      ),
    );
  }

  @override
  void onInit() {
    downloadSocket = repository.socketDownloads();
    super.onInit();
  }

  @override
  void onReady() async {
    downloadSocket.onMessage((val) {
      downloadsList = Downloads.fromJson(val);
    });
    super.onReady();
  }

  @override
  void onClose() {
    downloadSocket.close();
  }
}
