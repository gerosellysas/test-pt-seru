import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_math/vector_math_64.dart';

class PreviewScreen extends StatelessWidget {
  final XFile? file;
  final double? scale;
  final bool? enableZoom;
  final void Function(ScaleStartDetails)? onScaleStart;
  final void Function(ScaleUpdateDetails)? onScaleUpdate;
  final void Function(ScaleEndDetails)? onScaleEnd;
  final void Function()? onDoubleTap;

  const PreviewScreen({
    super.key,
    this.file,
    this.scale,
    this.enableZoom,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    if (file!.path == "" || file == null) {
      return Container();
    }
    if (!enableZoom!) {
      return Image.file(File(file!.path));
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTap: onDoubleTap,
      child: Transform(
        transform: Matrix4.diagonal3(Vector3(scale!, scale!, scale!)),
        alignment: FractionalOffset.center,
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 1.25,
          onInteractionStart: onScaleStart,
          onInteractionUpdate: onScaleUpdate,
          onInteractionEnd: onScaleEnd,
          child: Image.file(
            File(file!.path),
            height: 1.sh,
            width: 1.sw,
          ),
        ),
      ),
    );
  }
}
