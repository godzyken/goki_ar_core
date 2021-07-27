import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/display_picture_controller.dart';

class DisplayPictureView extends GetView<DisplayPictureController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisplayPictureController>(
      init: DisplayPictureController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Display Picture View'),
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: FileImage(
                File(_.imagePath!),
              ),
                  fit: BoxFit.cover
              ),
            ),
          ),
        );
      },
    );
  }
}
