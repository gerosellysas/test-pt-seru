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
              Obx(() => PhotoCard(
                    title: "ID card",
                    file: c.app.cameraFiles[0].value,
                    onCapture: () => c.onCaptureTapped(
                      camMode: 0,
                      fileIndex: 0,
                    ),
                    onPreview: () => c.onPreviewTapped(0),
                  )),
              Obx(() => PhotoCard(
                    title: "Selfie photo",
                    file: c.app.cameraFiles[1].value,
                    onCapture: () => c.onCaptureTapped(
                      camMode: 1,
                      fileIndex: 1,
                    ),
                    onPreview: () => c.onPreviewTapped(1),
                  )),
              Obx(() => PhotoCard(
                    title: "Freestyle photo",
                    file: c.app.cameraFiles[2].value,
                    onCapture: () => c.onCaptureTapped(
                      camMode: 0,
                      fileIndex: 2,
                    ),
                    onPreview: () => c.onPreviewTapped(2),
                  )),
              const Expanded(child: SizedBox()),
              PhotoNavigation(
                onBackTap: () => c.onBackTapped(),
                onSaveTap: () => c.onSaveTapped(),
              ),
            ],
          ),
        );
      },
    );
  }
}
