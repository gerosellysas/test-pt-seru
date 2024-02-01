import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalController extends GetxController with WidgetsBindingObserver {
  final _view = WidgetsBinding.instance.platformDispatcher.views.first;

  var fieldControllers = <TextEditingController>[];
  var fieldFocuses = <FocusNode>[];

  var bottomHeight = 0.0.obs;

  @override
  void onInit() {
    for (var i = 0; i < 3; i++) {
      fieldControllers.add(TextEditingController());
    }
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
    for (var controller in fieldControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    bottomHeight.value = _view.viewInsets.bottom / _view.devicePixelRatio;
    super.didChangeMetrics();
  }

  void onFieldSubmitted(int i, String str) {
    fieldControllers[i].text = str.trimRight();
    if (i == 2) {
      FocusManager.instance.primaryFocus!.unfocus();
      Future.delayed(const Duration(milliseconds: 175), () async {
        await Get.toNamed("/location");
      });
    }
  }
}
