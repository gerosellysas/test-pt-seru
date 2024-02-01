import 'package:camera/src/camera_controller.dart';
import 'package:camera_platform_interface/src/types/camera_exception.dart';
import 'package:cross_file/src/types/interface.dart';
import 'package:dartz/dartz.dart';
import 'package:test_pt_seru/feature/camera/data/services/camera.service.dart';
import 'package:test_pt_seru/feature/camera/domain/interfaces/camera.interface.dart';

class CameraRepo implements ICamera {
  CameraRepo({
    CameraService? service,
  }) : _service = service ?? CameraService();

  final CameraService _service;

  @override
  Future<CameraController> initialize(int index) async {
    return await _service.initialized(index);
  }

  @override
  Future<Either<CameraException, XFile?>> takePicture() async {
    return await _service.takePicture();
  }

  @override
  Future<void> deletePicture() async {
    _service.deletePicture();
  }

  @override
  void dispose() {
    _service.dispose();
  }
}
