import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class PersonalNavigation extends StatelessWidget {
  final double? bottomHeight;
  final void Function()? onTap;

  const PersonalNavigation({
    super.key,
    this.bottomHeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          PrimaryButton(
            text: "Next",
            onTap: onTap,
          ),
          SizedBox(height: 48.h + bottomHeight!),
        ],
      ),
    );
  }
}
