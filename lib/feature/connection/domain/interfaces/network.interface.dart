import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetwork {
  Stream<ConnectivityResult> checkAvailability();
}
