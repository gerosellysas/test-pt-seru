import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var fieldControllers = <TextEditingController>[];
  var fieldFocuses = <FocusNode>[];

  @override
  void onInit() {
    for (var i = 0; i < 7; i++) {
      fieldControllers.add(TextEditingController());
      fieldFocuses.add(FocusNode());
    }
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
    super.onClose();
  }
}
