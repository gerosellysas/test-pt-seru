import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pt_seru/feature/connection/connection.dart';

class AppService extends GetxService with WidgetsBindingObserver {
  final NetworkCheckAvailabilityUseCase _networkCheckAvailability =
      NetworkCheckAvailabilityUseCase();

  final _view = WidgetsBinding.instance.platformDispatcher.views.first;

  StreamSubscription<ConnectivityResult>? streamConnectivityResult;

  var connectivity = ConnectivityResult.none.obs;
  var personal = ["".obs, "".obs, "".obs];
  var region = ["".obs, "".obs, "".obs, "".obs];
  var cardId = "".obs;
  var bottomHeight = 0.0.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() {
    startCheckingConnectivity();

    super.onReady();
  }

  @override
  void onClose() {
    stopCheckingConnectivity();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    bottomHeight.value = _view.viewInsets.bottom / _view.devicePixelRatio;
    super.didChangeMetrics();
  }

  Future<void> startCheckingConnectivity() async {
    await stopCheckingConnectivity();
    streamConnectivityResult =
        _networkCheckAvailability.execute().listen((result) {
      connectivity.value = result;
    });
  }

  Future<void> stopCheckingConnectivity() async {
    if (streamConnectivityResult == null) return;
    streamConnectivityResult?.cancel();
    streamConnectivityResult = null;
  }
}