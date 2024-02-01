import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:test_pt_seru/feature/camera/camera.dart';
import 'package:test_pt_seru/feature/camera/domain/usecases/camera.dispose.usecase.dart';
import 'package:test_pt_seru/feature/camera/domain/usecases/camera.initialize.usecase.dart';

class CameraService extends GetxService {
  final CameraInitializeUseCase _cameraInitialize = CameraInitializeUseCase();
  final CameraTakePictureUseCase _cameraTakePicture =
      CameraTakePictureUseCase();
  final CameraDeletePictureUseCase _cameraDeletePicture =
      CameraDeletePictureUseCase();
  final CameraDisposeUseCase _cameraDispose = CameraDisposeUseCase();

  late CameraController cameraController;

  @override
  void onClose() {
    _cameraDispose.execute();
    super.onClose();
  }

  Future<void> initCamera(int index) async {
    cameraController = await _cameraInitialize.execute(index);
  }

  Future<XFile?> takePicture() async {
    XFile? file;
    var res = await _cameraTakePicture.execute();
    res.fold((l) => null, (r) => file = r);
    if (res.isLeft()) return null;
    return file;
  }

  Future<void> deletePicture() async {
    await _cameraDeletePicture.execute();
  }
}
