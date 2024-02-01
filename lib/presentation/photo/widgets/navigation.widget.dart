import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class PhotoNavigation extends StatelessWidget {
  final void Function()? onBackTap;
  final void Function()? onSaveTap;

  const PhotoNavigation({
    super.key,
    this.onBackTap,
    this.onSaveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton(
                w: 164.w,
                text: "Back",
                color: Hues.red.withOpacity(0.72),
                onTap: onBackTap,
              ),
              PrimaryButton(
                w: 164.w,
                text: "Save",
                onTap: onSaveTap,
              )
            ],
          ),
          SizedBox(height: 48.h),
        ],
      ),
    );
  }
}
