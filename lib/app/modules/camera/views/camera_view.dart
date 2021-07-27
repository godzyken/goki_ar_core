import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraViewController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraViewController>(
      init: CameraViewController(),
      builder: (_) {
        return Scaffold(
            body: FutureBuilder(
                future: _.initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Stack(
                      children: <Widget>[
                        ArCoreFaceView(
                          onArCoreViewCreated: _.onArCoreViewCreated,
                          enableAugmentedFaces: true,
                        ),
                        CameraPreview(_.camController!),
                        Positioned(
                          bottom: 0.0,
                          left: 10.0,
                          right: 10.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                width: 50.0,
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera,
                                    color: Colors.yellow,
                                    size: 40.0,
                                  ),
                                  onPressed: () async {
                                    try {
                                      await _.initializeControllerFuture;

                                      final path = join(
                                        // Store the picture in the temp directory.
                                        // Find the temp directory using the path_provider plugin.
                                        (await getTemporaryDirectory()).path,
                                        '${DateTime.now()}.png',
                                      );
                                      // Attempt to take a picture and log where it's been saved.
                                      await _.camController!.takePicture();

                                      Navigator.push(
                                          context,
                                          GetPageRoute(
                                            routeName: '/display-picture',
                                            transitionDuration:
                                                Duration(milliseconds: 300),
                                          ));
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }));
      },
    );
  }
}
