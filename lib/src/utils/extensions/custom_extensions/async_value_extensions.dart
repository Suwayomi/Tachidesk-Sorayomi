// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../misc/toast/toast.dart';

extension AsyncValueExtensions on AsyncValue {
  void showToastOnError(Toast toast) {
    if (!isRefreshing) {
      maybeWhen(
        error: (error, stackTrace) {
          toast.close();
          toast.showError(error.toString());
        },
        orElse: () {},
      );
    }
  }
}
