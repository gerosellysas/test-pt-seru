import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class ResultNavigation extends StatelessWidget {
  final void Function()? onEditTap;

  const ResultNavigation({
    super.key,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          PrimaryButton(
            text: "Edit data",
            onTap: onEditTap,
          ),
          SizedBox(height: 48.h),
        ],
      ),
    );
  }
}
