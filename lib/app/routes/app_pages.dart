import 'package:get/get.dart';

import 'package:project_arcore/app/modules/camera/bindings/camera_binding.dart';
import 'package:project_arcore/app/modules/camera/views/camera_view.dart';
import 'package:project_arcore/app/modules/display_picture/bindings/display_picture_binding.dart';
import 'package:project_arcore/app/modules/display_picture/views/display_picture_view.dart';
import 'package:project_arcore/app/modules/home/bindings/home_binding.dart';
import 'package:project_arcore/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.DISPLAY_PICTURE,
      page: () => DisplayPictureView(),
      binding: DisplayPictureBinding(),
    ),
  ];
}
