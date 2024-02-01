import 'package:get/get.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';

class SplashController extends GetxController {
  final AppService app = Get.find();

  @override
  void onReady() {
    _initializedSplash();
    super.onReady();
  }

  void _initializedSplash() {
    if (Get.currentRoute != "/") return;
    Future.delayed(const Duration(seconds: 1), () async {
      await Get.offAllNamed("/welcome");
    });
  }

  void onWelcomeButtonTapped() async {
    await Get.offAllNamed("/personal");
  }
}
