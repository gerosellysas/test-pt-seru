import 'package:test_pt_seru/feature/camera/data/repos/camera.repo.dart';
import 'package:test_pt_seru/feature/camera/domain/interfaces/camera.interface.dart';

class CameraDeletePictureUseCase {
  CameraDeletePictureUseCase({
    ICamera? repo,
  }) : _repo = repo ?? CameraRepo();

  final ICamera _repo;

  Future<void> execute() async {
    _repo.deletePicture();
  }
}
