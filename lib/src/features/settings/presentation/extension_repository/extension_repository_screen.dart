import 'package:flutter/material.dart';

import '../../../../utils/extensions/custom_extensions.dart';

class ExtensionRepositoryScreen extends StatelessWidget {
  const ExtensionRepositoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.extensionRepository)),
    );
  }
}
