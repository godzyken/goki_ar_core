import 'dart:io';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CameraViewController extends GetxController {
  //TODO: Implement CameraViewController
  List<CameraDescription>? cameras;

  late int crownToShow;
  ByteData? textureBytes;
  File? imageFile;

  ArCoreFaceController? arCoreFaceController;
  CameraController? camController;

  late Future<void> initializeControllerFuture;

  @override
  void onInit() {
    initController();
    availableCameras();
    initializeControllerFuture = camController!.initialize();


    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initController() async {
    cameras = await availableCameras();

    final ByteData? textureBytes =
        await rootBundle.load('resources/images/black.png');

    arCoreFaceController!.loadMesh(
        textureBytes: textureBytes!.buffer.asUint8List(),
        skin3DModelFilename: "c.sfb");
  }


  void onArCoreViewCreated(ArCoreFaceController? controller) {
    arCoreFaceController = controller;
    loadMesh();
  }

  loadMesh() async {
    final ByteData? textureBytes =
        await rootBundle.load('resources/images/black.png');

    arCoreFaceController!.loadMesh(
        textureBytes: textureBytes!.buffer.asUint8List(),
        skin3DModelFilename: "tt.sfb");
  }

}
