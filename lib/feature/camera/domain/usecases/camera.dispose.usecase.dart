import 'package:test_pt_seru/feature/camera/data/repos/camera.repo.dart';
import 'package:test_pt_seru/feature/camera/domain/interfaces/camera.interface.dart';

class CameraDisposeUseCase {
  CameraDisposeUseCase({
    ICamera? repo,
  }) : _repo = repo ?? CameraRepo();

  final ICamera _repo;

  void execute() {
    _repo.dispose();
  }
}
