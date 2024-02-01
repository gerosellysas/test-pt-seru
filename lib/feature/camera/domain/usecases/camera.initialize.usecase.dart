import 'package:camera/camera.dart';
import 'package:test_pt_seru/feature/camera/data/repos/camera.repo.dart';
import 'package:test_pt_seru/feature/camera/domain/interfaces/camera.interface.dart';

class CameraInitializeUseCase {
  CameraInitializeUseCase({
    ICamera? repo,
  }) : _repo = repo ?? CameraRepo();

  final ICamera _repo;

  Future<CameraController> execute(int index) async {
    return await _repo.initialize(index);
  }
}
