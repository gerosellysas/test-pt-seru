import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class LocationNavigation extends StatelessWidget {
  final double? bottomHeight;
  final void Function()? onBackTap;
  final void Function()? onNextTap;

  const LocationNavigation({
    super.key,
    this.bottomHeight,
    this.onBackTap,
    this.onNextTap,
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
                text: "Next",
                onTap: onNextTap,
              )
            ],
          ),
          SizedBox(height: 48.h + bottomHeight!),
        ],
      ),
    );
  }
}
