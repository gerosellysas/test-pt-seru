import 'package:flutter/material.dart';
import 'package:flutter_json_viewer/flutter_json_viewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class ResultReview extends StatelessWidget {
  final Map<String, dynamic>? result;

  const ResultReview({
    super.key,
    this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Container(
        height: 540.h,
        width: 352.w,
        decoration: BoxDecoration(
          color: Hues.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
              color: Hues.black.withOpacity(0.32),
              blurRadius: 2,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child:
              // Text(
              //   result!,
              //   style: Fonts.normal(),
              // ),
              JsonViewer(result!),
        ),
      ),
    );
  }
}
