import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';

class PersonalController extends GetxController with WidgetsBindingObserver {
  final AppService app = Get.find();

  var fieldControllers = <TextEditingController>[];
  var fieldFocuses = <FocusNode>[];

  var fieldErrors = <RxBool>[].obs;
  var fieldErrorsText = <RxString>[].obs;

  @override
  void onInit() {
    for (var i = 0; i < 3; i++) {
      fieldControllers.add(TextEditingController(text: app.personal[i].value));
      fieldErrors.add(false.obs);
      fieldErrorsText.add("".obs);
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

  void onFieldChanged(int i, String str) {
    fieldErrors[i].value = false;
    fieldErrorsText[i].value = "";
    app.personal[i].value = str;
  }

  void onFieldSubmitted(int i, String str) {
    fieldControllers[i].text = str.trimRight();
    if (i != 2) return;
    onButtonTapped();
  }

  void onButtonTapped() async {
    FocusManager.instance.primaryFocus!.unfocus();
    validateFieldInput();
    var empty = fieldErrors.any((error) => error.value == true);
    if (empty) return;
    await Get.toNamed("/location");
  }

  void validateFieldInput() {
    for (var i = 0; i < fieldControllers.length; i++) {
      if (fieldControllers[i].text.isEmpty) {
        fieldErrors[i].value = true;
        fieldErrorsText[i].value = "Field can't be empty";
      }
    }
  }
}
