import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/extensions_controller.dart';

class ExtensionsView extends GetView<ExtensionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ExtensionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
