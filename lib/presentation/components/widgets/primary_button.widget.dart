import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  final double? w;
  final String? text;
  final Color? color;
  final void Function()? onTap;

  const PrimaryButton({
    super.key,
    this.w,
    this.text,
    this.color,
    this.onTap,
  });

  double get _width => w ?? 304.w;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(12.w),
          color: color ?? Hues.primary,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.w),
            highlightColor: Hues.blue.withOpacity(0.48),
            splashColor: Hues.blue.withOpacity(0.48),
            onTap: onTap,
            child: Container(
              height: 40.h,
              width: _width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            height: 40.h,
            width: _width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Text(
              text!,
              style: Fonts.semiBold(color: Hues.white),
            ),
          ),
        ),
      ],
    );
  }
}
