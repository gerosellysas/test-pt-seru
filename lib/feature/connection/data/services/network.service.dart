import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  NetworkService._({
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();
  static final _singleton = NetworkService._();
  factory NetworkService() => _singleton;

  final Connectivity _connectivity;

  Stream<ConnectivityResult> checkAvailability() async* {
    yield* _connectivity.onConnectivityChanged;
  }
}
