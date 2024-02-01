import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class RoundedIconButton extends StatelessWidget {
  final double? size;
  final double? outterSize;
  final String? icon;
  final Color? color;
  final void Function()? onTap;

  const RoundedIconButton({
    super.key,
    this.size,
    this.outterSize,
    this.icon,
    this.color,
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
            borderRadius: BorderRadius.circular(size ?? 24.w),
            highlightColor: Hues.grey.withOpacity(0.24),
            splashColor: Hues.grey.withOpacity(0.24),
            onTap: onTap,
            child: Container(
              height: outterSize ?? 48.w,
              width: outterSize ?? 48.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            height: size ?? 24.w,
            width: size ?? 24.w,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon!,
              fit: BoxFit.fill,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
