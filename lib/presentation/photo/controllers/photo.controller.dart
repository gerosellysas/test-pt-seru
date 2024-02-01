import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';

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

  Future<void> requestCameraPermission() async {
    await Permission.camera.onDeniedCallback(() {}).onGrantedCallback(() async {
      await cam.initCamera(0);
      cam.cameraController.initialize().then((_) async {
        // TODO: GO TO CAMERA UI
      });
    }).onPermanentlyDeniedCallback(() async {
      await openAppSettings();
    }).request();
  }
}
