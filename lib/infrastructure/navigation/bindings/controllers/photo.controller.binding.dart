import 'package:get/get.dart';

import '../../../../presentation/photo/controllers/photo.controller.dart';

class PhotoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoController>(
      () => PhotoController(),
    );
  }
}
