import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

abstract class ICamera {
  Future<CameraController> initialize(int index);

  Future<Either<CameraException, XFile?>> takePicture();

  Future<void> deletePicture();

  void dispose();
}
