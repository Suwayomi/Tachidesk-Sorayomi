// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/toast/toast.dart';

class MediaLaunchButton extends StatelessWidget {
  const MediaLaunchButton({
    super.key,
    required this.toast,
    required this.title,
    required this.iconData,
    required this.url,
  });

  final Toast toast;
  final String title;
  final IconData iconData;
  final String url;

  @override
  Widget build(BuildContext context) {
    return url.isNotBlank
        ? context.isSmallTabletOrLess
            ? IconButton(
                tooltip: title,
                onPressed: () => launchUrlInWeb(url, toast),
                icon: Icon(iconData),
              )
            : TextButton.icon(
                label: Text(title),
                onPressed: () => launchUrlInWeb(url, toast),
                icon: Icon(iconData),
              )
        : const SizedBox.shrink();
  }
}
