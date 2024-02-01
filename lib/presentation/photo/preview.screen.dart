import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final XFile? file;

  const PreviewScreen({
    super.key,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    if (file!.path == "" || file == null) {
      return Container();
    }
    return Container(
      child: Image.file(File(file!.path)),
    );
  }
}
