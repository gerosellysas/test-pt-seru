import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class PhotoCard extends StatelessWidget {
  final String? title;
  final void Function()? onTap;

  const PhotoCard({
    super.key,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100.h,
          width: 352.w,
          padding: EdgeInsets.all(12.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Hues.white,
            borderRadius: BorderRadius.circular(16.w),
            boxShadow: [
              BoxShadow(
                color: Hues.black.withOpacity(0.32),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                style: Fonts.semiBold(),
              ),
              Container(
                height: 180.h,
                width: 160.w,
                decoration: BoxDecoration(
                  color: Hues.grey.withOpacity(0.24),
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
