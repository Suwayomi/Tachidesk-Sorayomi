import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';

import 'package:tachidesk_sorayomi/src/utils/launch_url_in_web.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast.dart';

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
        ? TextButton.icon(
            label: Text(title),
            onPressed: () => launchUrlInWeb(url, toast),
            icon: Icon(iconData),
          )
        : const SizedBox.shrink();
  }
}
