import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test_pt_seru/feature/connection/data/repos/repos.dart';
import 'package:test_pt_seru/feature/connection/domain/interfaces/interfaces.dart';

class NetworkCheckAvailabilityUseCase {
  NetworkCheckAvailabilityUseCase({
    INetwork? repo,
  }) : _repo = repo ?? NetworkRepo();

  final INetwork _repo;

  Stream<ConnectivityResult> execute() async* {
    yield* _repo.checkAvailability();
  }
}
