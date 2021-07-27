import 'dart:io';

import 'package:get/get.dart';

class DisplayPictureController extends GetxController {
  //TODO: Implement DisplayPictureController

  File? imageFile;

  String? imagePath;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    imagePath = imageFile!.path;
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
