import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../infrastructure/sources/constants/constants.dart';
import '../components/widgets/widgets.components.dart';

class CameraScreen extends StatelessWidget {
  final CameraController? controller;
  final void Function()? onShutter;

  const CameraScreen({
    super.key,
    this.controller,
    this.onShutter,
  });

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container(
        color: Hues.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (controller!.description.lensDirection == CameraLensDirection.front) {
      return _CameraFront(
        key: key,
        controller: controller,
        onShutter: onShutter,
      );
    }
    return _CameraBack(
      key: key,
      controller: controller!,
      onShutter: onShutter,
    );
  }
}

class _CameraFront extends StatelessWidget {
  final CameraController? controller;
  final void Function()? onShutter;

  const _CameraFront({
    super.key,
    this.controller,
    this.onShutter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenUtil().statusBarHeight + 8.h),
        Row(
          children: [
            SizedBox(width: 24.w),
            _CameraFlash(
              key: key,
              icon: Images.flashOff,
              onTap: () => controller!.setFlashMode(FlashMode.off),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(width: 24.w),
            _CameraFlash(
              key: key,
              icon: Images.flashOn,
              onTap: () => controller!.setFlashMode(FlashMode.torch),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(width: 24.w),
            _CameraFlash(
              key: key,
              icon: Images.flashAuto,
              onTap: () => controller!.setFlashMode(FlashMode.auto),
            ),
            SizedBox(width: 24.w),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          height: 2.w,
          color: Hues.white,
        ),
        SizedBox(
          height: 520.h,
          width: 1.sw,
          child: AspectRatio(
            aspectRatio: controller!.value.aspectRatio,
            child: CameraPreview(
              controller!,
            ),
          ),
        ),
        Container(
          height: 2.w,
          color: Hues.white,
        ),
        const Expanded(child: SizedBox()),
        _CameraShutter(
          key: key,
          onShutter: onShutter,
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}

class _CameraBack extends StatelessWidget {
  final CameraController? controller;
  final void Function()? onShutter;

  const _CameraBack({
    super.key,
    this.controller,
    this.onShutter,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(
        controller!,
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().statusBarHeight + 8.h),
            Row(
              children: [
                SizedBox(width: 24.w),
                _CameraFlash(
                  key: key,
                  icon: Images.flashOff,
                  onTap: () => controller!.setFlashMode(FlashMode.off),
                ),
                const Expanded(child: SizedBox()),
                SizedBox(width: 24.w),
                _CameraFlash(
                  key: key,
                  icon: Images.flashOn,
                  onTap: () => controller!.setFlashMode(FlashMode.torch),
                ),
                const Expanded(child: SizedBox()),
                SizedBox(width: 24.w),
                _CameraFlash(
                  key: key,
                  icon: Images.flashAuto,
                  onTap: () => controller!.setFlashMode(FlashMode.auto),
                ),
                SizedBox(width: 24.w),
              ],
            ),
            const Expanded(child: SizedBox()),
            _CameraShutter(
              key: key,
              onShutter: onShutter,
            ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}

class _CameraFlash extends StatelessWidget {
  final String? icon;
  final void Function()? onTap;

  const _CameraFlash({
    super.key,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 64.w,
          width: 64.w,
          decoration: BoxDecoration(
            color: Hues.black.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
        ),
        RoundedIconButton(
          size: 36.w,
          outterSize: 64.w,
          icon: icon!,
          onTap: onTap,
        ),
      ],
    );
  }
}

class _CameraShutter extends StatelessWidget {
  final void Function()? onShutter;

  const _CameraShutter({
    super.key,
    this.onShutter,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 90.w,
          width: 90.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Hues.white,
              width: 4.w,
            ),
          ),
          child: Center(
            child: Material(
              shape: const CircleBorder(),
              color: Hues.primary,
              child: InkWell(
                borderRadius: BorderRadius.circular(41.w),
                highlightColor: Hues.blue.withOpacity(0.48),
                splashColor: Hues.blue.withOpacity(0.48),
                onTap: onShutter,
                child: Container(
                  height: 82.w,
                  width: 82.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            height: 30.w,
            width: 30.w,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              Images.camera,
            ),
          ),
        ),
      ],
    );
  }
}
