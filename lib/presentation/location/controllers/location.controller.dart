import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController with WidgetsBindingObserver {
  final _view = WidgetsBinding.instance.platformDispatcher.views.first;

  var bottomHeight = 0.0.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() {
    //
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
