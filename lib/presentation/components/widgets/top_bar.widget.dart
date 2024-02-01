import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';
import 'package:test_pt_seru/presentation/components/widgets/rounded_icon_button.widget.dart';

class TopBar extends StatelessWidget {
  final String? title;
  final bool? enableBack;
  final void Function()? onBackTap;

  const TopBar({
    super.key,
    this.enableBack = false,
    this.title,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
      child: Container(
        height: kToolbarHeight,
        width: 1.sw,
        alignment: Alignment.center,
        child: enableBack == true
            ? Row(
                children: [
                  RoundedIconButton(
                    icon: Images.back,
                    onTap: onBackTap,
                  ),
                  Text(
                    title!,
                    style: Fonts.bold(
                      color: Hues.blue,
                      size: 15.sp,
                    ),
                  ),
                  SizedBox(width: 48.w),
                ],
              )
            : Text(
                title!,
                style: Fonts.bold(
                  color: Hues.blue,
                  size: 15.sp,
                ),
              ),
      ),
    );
  }
}
