import 'package:get/get.dart';

import '../../../../presentation/components/services/services.components.dart';
import '../../../../presentation/splash/controllers/splash.controller.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppService>(
      () => AppService(),
      fenix: true,
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
