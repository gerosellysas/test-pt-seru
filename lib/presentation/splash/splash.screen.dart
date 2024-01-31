import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/splash.controller.dart';
import 'widgets/splash/splash.widgets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {},
      builder: (c) {
        return const ScaffoldView(
          view: Column(
            children: [
              Expanded(child: SizedBox()),
              SplashLogo(),
              Expanded(child: SizedBox()),
              SplashFooter(),
            ],
          ),
        );
      },
    );
  }
}
