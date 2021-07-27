import 'package:get/get.dart';

import '../controllers/display_picture_controller.dart';

class DisplayPictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisplayPictureController>(
      () => DisplayPictureController(),
    );
  }
}
