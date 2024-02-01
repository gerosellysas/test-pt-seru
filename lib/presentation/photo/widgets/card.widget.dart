import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class PhotoCard extends StatelessWidget {
  final String? title;
  final XFile? file;
  final void Function()? onCapture;
  final void Function()? onPreview;

  const PhotoCard({
    super.key,
    this.title,
    this.file,
    this.onCapture,
    this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Container(
        height: 180.h,
        width: 352.w,
        padding: EdgeInsets.all(18.w),
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
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: Fonts.semiBold(),
                ),
                GestureDetector(
                  onTap: onPreview,
                  child: Container(
                    height: 90.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: Hues.grey.withOpacity(0.24),
                      borderRadius: BorderRadius.circular(8.w),
                      image: file == null || file!.path == ""
                          ? null
                          : DecorationImage(
                              image: FileImage(File(file!.path)),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            _PhotoCardButton(
              key: key,
              w: 312.w,
              text: file!.path != "" ? "Recapture" : "Capture",
              onTap: onCapture,
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoCardButton extends StatelessWidget {
  final double? w;
  final String? text;
  final void Function()? onTap;

  const _PhotoCardButton({
    super.key,
    this.w,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(12.w),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.w),
            highlightColor: Hues.blue.withOpacity(0.24),
            splashColor: Hues.blue.withOpacity(0.24),
            onTap: onTap,
            child: Container(
              height: 40.h,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(
                  color: Hues.primary,
                ),
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            height: 40.h,
            width: w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Text(
              text!,
              style: Fonts.semiBold(color: Hues.primary),
            ),
          ),
        ),
      ],
    );
  }
}
