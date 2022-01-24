import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/reader_settings_controller.dart';

class ReaderSettingsView extends GetView<ReaderSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReaderSettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReaderSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
