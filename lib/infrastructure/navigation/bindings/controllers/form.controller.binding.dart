import 'package:get/get.dart';

import '../../../../presentation/form/controllers/form.controller.dart';

class FormControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(
      () => FormController(),
    );
  }
}
