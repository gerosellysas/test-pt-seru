import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';
import 'package:test_pt_seru/presentation/screens.dart';

class PhotoController extends GetxController {
  final AppService app = Get.find<AppService>();
  final CameraHelper cam = Get.find<CameraHelper>();

  final _scale = 1.0.obs;
  double? _previousScale;

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  void onBackTapped() {
    Get.back();
  }

  Future<void> onCaptureTapped({
    required int camMode,
    required int fileIndex,
  }) async {
    await Permission.camera.onDeniedCallback(() {}).onGrantedCallback(() async {
      await cam.initCamera(camMode);
      cam.controller.initialize().then((_) async {
        cam.controller.lockCaptureOrientation(DeviceOrientation.portraitUp);
        await Get.to(() => CameraScreen(
              controller: cam.controller,
              onShutter: () => _onShuttered(fileIndex),
            ));
      });
    }).onPermanentlyDeniedCallback(() async {
      await openAppSettings();
    }).request();
  }

  Future<void> _onShuttered(int i) async {
    app.cameraFiles[i].value = await cam.takePicture() ?? XFile("");
    await Get.to(
      () => PreviewScreen(
        file: app.cameraFiles[i].value,
        enableZoom: false,
      ),
    );
  }

  Future<void> onPreviewTapped(int fileIndex) async {
    if (app.cameraFiles[fileIndex].value.path == "") return;
    _scale.value = 1;
    await Get.to(
      () => Obx(() => PreviewScreen(
            file: app.cameraFiles[fileIndex].value,
            scale: _scale.value,
            enableZoom: true,
            onScaleStart: (details) {
              _previousScale = _scale.value;
            },
            onScaleUpdate: (details) {
              _scale.value = _previousScale! * details.scale;
              if (_scale.value > 4) _scale.value = 4;
              if (_scale.value < 1) _scale.value = 1;
              cam.controller.setZoomLevel(_scale.value);
            },
            onScaleEnd: (details) {
              _previousScale = null;
            },
            onDoubleTap: () {
              _scale.value++;
              if (_scale.value > 4) _scale.value = 1;
              cam.controller.setZoomLevel(_scale.value);
            },
          )),
    );
  }

  void onSaveTapped() async {
    var empty = app.cameraFiles.any((file) => file.value.path == "");
    if (empty) return;
    for (var i = 0; i < app.cameraFiles.length; i++) {
      File file = File(app.cameraFiles[i].value.path);
      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      app.cameraBase64[i].value = base64Image;
    }
    await Get.offAllNamed("/result");
  }
}
