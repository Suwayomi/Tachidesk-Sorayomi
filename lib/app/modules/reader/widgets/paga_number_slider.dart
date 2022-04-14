import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reader_controller.dart';

class PagaNumberSlider extends StatelessWidget {
  const PagaNumberSlider({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Obx(() => Row(
              children: [
                Text("${controller.currentIndex + 1}"),
                Expanded(
                  child: Slider(
                    value: controller.currentIndex.toDouble(),
                    min: 0,
                    max: (controller.chapter.pageCount ?? 1).toDouble() - 1,
                    onChanged: (value) {
                      controller.sliderValue.value = value.toInt();
                    },
                  ),
                ),
                Text((controller.chapter.pageCount ?? 1).toString()),
              ],
            )),
      ),
    );
  }
}
