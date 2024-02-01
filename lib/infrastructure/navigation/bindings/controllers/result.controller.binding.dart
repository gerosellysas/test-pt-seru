import 'package:get/get.dart';

import '../../../../presentation/result/controllers/result.controller.dart';

class ResultControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(
      () => ResultController(),
    );
  }
}
