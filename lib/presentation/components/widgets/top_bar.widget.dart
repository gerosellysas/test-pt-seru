import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

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
                  _BackButton(
                    key: key,
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

class _BackButton extends StatelessWidget {
  final void Function()? onTap;

  const _BackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          shape: const CircleBorder(),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24.w),
            highlightColor: Hues.grey.withOpacity(0.24),
            splashColor: Hues.grey.withOpacity(0.24),
            onTap: onTap,
            child: Container(
              height: 48.w,
              width: 48.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            height: 24.w,
            width: 24.w,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              Images.back,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
