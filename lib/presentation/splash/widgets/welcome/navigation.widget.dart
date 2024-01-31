import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class WelcomeNavigation extends StatelessWidget {
  final void Function()? onTap;

  const WelcomeNavigation({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 64.h),
        PrimaryButton(
          text: "Get started",
          onTap: onTap,
        ),
      ],
    );
  }
}
