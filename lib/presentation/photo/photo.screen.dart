import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/photo.controller.dart';
import 'widgets/photos.widgets.dart';

class PhotoScreen extends GetView<PhotoController> {
  const PhotoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {},
      builder: (c) {
        return ScaffoldView(
          topBar: TopBar(
            title: "Upload photo",
            enableBack: true,
            onBackTap: () => c.onBackTapped(),
          ),
          view: Column(
            children: [
              PhotoCard(
                title: "ID card",
                onTap: () => c.requestCameraPermission(),
              ),
              PhotoCard(
                title: "Selfie photo",
                onTap: () => c.requestCameraPermission(),
              ),
              PhotoCard(
                title: "Freestyle photo",
                onTap: () => c.requestCameraPermission(),
              ),
              const Expanded(child: SizedBox()),
              PhotoNavigation(
                onBackTap: () => c.onBackTapped(),
              ),
            ],
          ),
        );
      },
    );
  }
}
