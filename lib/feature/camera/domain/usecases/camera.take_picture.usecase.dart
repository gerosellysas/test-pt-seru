import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:test_pt_seru/feature/camera/data/repos/camera.repo.dart';
import 'package:test_pt_seru/feature/camera/domain/interfaces/camera.interface.dart';

class CameraTakePictureUseCase {
  CameraTakePictureUseCase({
    ICamera? repo,
  }) : _repo = repo ?? CameraRepo();

  final ICamera _repo;

  Future<Either<CameraException, XFile?>> execute() async {
    return await _repo.takePicture();
  }
}
