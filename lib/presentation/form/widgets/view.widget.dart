import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormView extends StatelessWidget {
  final Widget? nameField;
  final Widget? regionField;
  final Widget? biodataField;
  final Widget? navigation;
  final double? bottomHeight;

  const FormView({
    super.key,
    this.nameField,
    this.regionField,
    this.biodataField,
    this.navigation,
    this.bottomHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              height: (1.sh + bottomHeight!) -
                  (kToolbarHeight + ScreenUtil().statusBarHeight),
              width: 1.sw,
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  nameField!,
                  SizedBox(height: 16.h),
                  biodataField!,
                  SizedBox(height: 16.h),
                  regionField!,
                  const Expanded(child: SizedBox()),
                  navigation!,
                  SizedBox(height: bottomHeight! + 48.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
