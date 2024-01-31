import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class ScaffoldView extends StatelessWidget {
  final void Function(bool)? onPopInvoked;
  final Widget? topBar;
  final Widget? view;

  const ScaffoldView({
    super.key,
    this.onPopInvoked,
    this.topBar,
    this.view,
  });

  double get _statusBarHeight => ScreenUtil().statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: onPopInvoked,
      child: Scaffold(
        backgroundColor: Hues.white,
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar ??
                  Container(
                    height: kToolbarHeight,
                    width: 1.sw,
                    margin: EdgeInsets.only(top: _statusBarHeight),
                  ),
              SizedBox(
                height: 1.sh - (_statusBarHeight + kToolbarHeight),
                width: 1.sw,
                child: view ?? const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
