import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/painting.dart';

class CameraService {
  CameraService._({
    Future<List<CameraDescription>>? cam,
  }) : _cam = cam ?? availableCamera();

  static final _singleton = CameraService._();

  factory CameraService() => _singleton;

  static Future<List<CameraDescription>> availableCamera() async {
    return await availableCameras();
  }

  final Future<List<CameraDescription>> _cam;
  late CameraDescription _description;
  late CameraController _controller;

  Future<CameraController> initialized(int index) async {
    var camera = await _cam;
    _description = camera[index];
    return _controller = CameraController(_description, ResolutionPreset.high);
  }

  Future<Either<CameraException, XFile?>> takePicture() async {
    if (!_controller.value.isInitialized) return right(null);
    if (_controller.value.isTakingPicture) return right(null);
    try {
      await _controller.setFlashMode(FlashMode.off);
      XFile picture = await _controller.takePicture();
      return right(picture);
    } on CameraException catch (e) {
      return left(e);
    }
  }

  Future<void> deletePicture() async {
    imageCache.clear();
    imageCache.clearLiveImages();
  }

  void dispose() {
    _controller.dispose();
  }
}
