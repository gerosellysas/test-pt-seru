import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({super.key});

  double get _topPadding => ScreenUtil().statusBarHeight + kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      width: 1.sw,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: _topPadding),
          Hero(
            tag: "logo",
            child: SizedBox(
              height: 180.w,
              width: 180.w,
              child: Image.asset(
                Images.logo,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "PT SOLUSI EKSPLORASI\nREMBULAN UTAMA",
            textAlign: TextAlign.center,
            style: Fonts.bold(color: Hues.primary, size: 22.sp),
          ),
        ],
      ),
    );
  }
}
