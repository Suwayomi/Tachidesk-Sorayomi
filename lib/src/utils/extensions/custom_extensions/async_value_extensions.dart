// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../misc/toast.dart';

// 📦 Package imports:

// 🌎 Project imports:

extension AsyncValueExtensions on AsyncValue {
  void showToastOnError(Toast toast) {
    toast.close();
    if (!isRefreshing) {
      maybeWhen(
        error: (error, stackTrace) => toast.showError(error.toString()),
        orElse: () {},
      );
    }
  }
}
