import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController with WidgetsBindingObserver {
  final _view = WidgetsBinding.instance.platformDispatcher.views.first;

  var fieldControllers = <TextEditingController>[];
  var fieldFocuses = <FocusNode>[];
  var dropdownSearchFocuses = <FocusNode>[];

  var dropdownSearchFieldActive = false.obs;
  var bottomHeight = 0.0.obs;

  @override
  void onInit() {
    for (var i = 0; i < 4; i++) {
      if (i < 3) {
        fieldControllers.add(TextEditingController());
        fieldFocuses.add(FocusNode());
      }
      dropdownSearchFocuses.add(FocusNode());
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
    for (var focus in fieldFocuses) {
      focus.dispose();
    }
    for (var focus in dropdownSearchFocuses) {
      focus.dispose();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    bottomHeight.value = _view.viewInsets.bottom / _view.devicePixelRatio;
    dropdownSearchFieldActive.value = dropdownSearchFocuses.any(
      (f) => f.hasPrimaryFocus,
    );
    super.didChangeMetrics();
  }

  void onFieldSubmitted(int i, String str) {
    fieldControllers[i].text = str.trimRight();
  }
}
