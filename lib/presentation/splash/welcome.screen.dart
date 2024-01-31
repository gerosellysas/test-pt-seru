import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/splash.controller.dart';
import 'widgets/welcome/welcome.widgets.dart';

class WelcomeScreen extends GetView<SplashController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {},
      builder: (c) {
        return ScaffoldView(
          view: Column(
            children: [
              const WelcomeLogo(),
              WelcomeNavigation(
                onTap: () => c.onWelcomeButtonTapped(),
              ),
            ],
          ),
        );
      },
    );
  }
}
