import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Developed by:",
          style: Fonts.italic(size: 12.sp),
        ),
        SizedBox(height: 8.h),
        Text(
          "Geroselly Suryo Adi Sumanto",
          style: Fonts.semiBold(color: Hues.blue),
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
