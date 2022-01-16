import 'package:get/get.dart';

import '../../../data/downloads_model.dart';
import '../../../data/repository/download_queue_value_repository.dart';
import '../../../data/repository/downloads_repository.dart';

class DownloadsController extends GetxController {
  final DownloadsRepository downloadsRepository = DownloadsRepository();
  final DownloadQueueValueRepository downloadQueueValueRepository =
      DownloadQueueValueRepository();

  late final GetSocket downloadSocket;
  final Rx<Downloads> _downloadsList = Downloads().obs;

  Rx<Downloads> get downloadsListObs => _downloadsList;
  Downloads get downloadsList => _downloadsList.value;
  set downloadsList(Downloads value) => _downloadsList.value = value;

  @override
  void onInit() {
    downloadSocket = downloadsRepository.socketDownloads();
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
