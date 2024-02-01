import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppService extends GetxService with WidgetsBindingObserver {
  final _view = WidgetsBinding.instance.platformDispatcher.views.first;

  var bottomHeight = 0.0.obs;

  var personal = ["".obs, "".obs, "".obs];
  var region = ["".obs, "".obs, "".obs, "".obs];
  var cardId = "".obs;

  @override
  void onReady() {
    WidgetsBinding.instance.addObserver(this);
    super.onReady();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    bottomHeight.value = _view.viewInsets.bottom / _view.devicePixelRatio;
    super.didChangeMetrics();
  }
}
