import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.production
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.qas ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
      binding: SplashControllerBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    ),
    GetPage(
      name: Routes.personal,
      page: () => const PersonalScreen(),
      binding: PersonalControllerBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    ),
    GetPage(
      name: Routes.location,
      page: () => const LocationScreen(),
      binding: LocationControllerBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    ),
  ];
}
