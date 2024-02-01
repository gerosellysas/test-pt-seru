import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/location.controller.dart';
import 'widgets/location.widgets.dart';

class LocationScreen extends GetView<LocationController> {
  const LocationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {},
      builder: (c) {
        return ScaffoldView(
          topBar: TopBar(
            title: "Address",
            enableBack: true,
            onBackTap: () {},
          ),
          view: Column(
            children: [
              LocationField(
                onTap: (i) => (),
                onChange: (i, str) => (),
              ),
              const Expanded(child: SizedBox()),
              Obx(() => LocationNavigation(
                    bottomHeight: c.bottomHeight.value,
                    onBackTap: () => (),
                    onNextTap: () => (),
                  )),
            ],
          ),
        );
      },
    );
  }
}
