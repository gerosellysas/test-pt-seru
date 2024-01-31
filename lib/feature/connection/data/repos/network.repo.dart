import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test_pt_seru/feature/connection/data/services/services.dart';
import 'package:test_pt_seru/feature/connection/domain/interfaces/interfaces.dart';

class NetworkRepo implements INetwork {
  NetworkRepo({
    NetworkService? service,
  }) : _service = service ?? NetworkService();

  final NetworkService _service;

  @override
  Stream<ConnectivityResult> checkAvailability() async* {
    yield* _service.checkAvailability();
  }
}
