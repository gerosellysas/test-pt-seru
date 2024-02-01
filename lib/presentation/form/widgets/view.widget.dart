import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormView extends StatelessWidget {
  final ScrollController? controller;
  final Widget? nameField;
  final Widget? regionField;
  final Widget? biodataField;
  final double? bottomHeight;

  const FormView({
    super.key,
    this.controller,
    this.nameField,
    this.regionField,
    this.biodataField,
    this.bottomHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: controller!,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              height: 1.sh -
                  (kToolbarHeight + ScreenUtil().statusBarHeight) +
                  bottomHeight!,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  nameField!,
                  SizedBox(height: 16.h),
                  biodataField!,
                  SizedBox(height: 16.h),
                  regionField!,
                  SizedBox(height: 48.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
