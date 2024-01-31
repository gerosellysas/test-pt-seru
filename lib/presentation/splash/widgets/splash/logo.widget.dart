import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: SizedBox(
        height: 160.w,
        width: 160.w,
        child: Image.asset(
          Images.logo,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
