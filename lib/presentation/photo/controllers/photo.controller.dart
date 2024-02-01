import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';
import 'package:test_pt_seru/presentation/screens.dart';

class PhotoController extends GetxController {
  final AppService app = Get.find<AppService>();
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

  Future<void> requestCameraPermission(int camMode, int fileIndex) async {
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
    print("=====> ${app.cameraFiles[i].value.path}");
    await Get.to(() => PreviewScreen(file: app.cameraFiles[i].value));
  }
}
