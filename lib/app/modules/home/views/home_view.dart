import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_arcore/app/modules/display_picture/views/display_picture_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/camera'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          clipBehavior: Clip.hardEdge,
          child: DisplayPictureView(),
        ),
      ),
    );
  }
}
