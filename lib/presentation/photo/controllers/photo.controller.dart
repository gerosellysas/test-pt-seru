import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';
import 'package:test_pt_seru/presentation/screens.dart';

class PhotoController extends GetxController {
  final CameraHelper cam = Get.find<CameraHelper>();

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

  Future<void> requestCameraPermission(int index) async {
    await Permission.camera.onDeniedCallback(() {}).onGrantedCallback(() async {
      await cam.initCamera(index);
      cam.controller.initialize().then((_) async {
        cam.controller.lockCaptureOrientation(DeviceOrientation.portraitUp);
        await Get.to(() => CameraScreen(
              controller: cam.controller,
            ));
      });
    }).onPermanentlyDeniedCallback(() async {
      await openAppSettings();
    }).request();
  }
}
