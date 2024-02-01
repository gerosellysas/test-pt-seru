import 'package:get/get.dart';

import '../../../../presentation/components/services/services.components.dart';
import '../../../../presentation/photo/controllers/photo.controller.dart';

class PhotoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraHelper>(
      () => CameraHelper(),
      fenix: true,
    );
    Get.lazyPut<PhotoController>(
      () => PhotoController(),
    );
  }
}
