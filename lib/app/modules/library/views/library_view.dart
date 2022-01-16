import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'LibraryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
