import 'package:get/get.dart';

class SplashController extends GetxController {
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
    await Get.offAllNamed("/form");
  }
}
