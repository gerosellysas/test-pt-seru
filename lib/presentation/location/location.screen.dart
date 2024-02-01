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
            onBackTap: () => c.onBackTapped(),
          ),
          view: Column(
            children: [
              Obx(() => LocationField(
                    items: (i, str) => c.getRegionNameData(i),
                    selectedItems: [
                      c.app.region[0].value,
                      c.app.region[1].value,
                      c.app.region[2].value,
                      c.app.region[3].value,
                    ],
                    errors: [
                      c.errors[0].value,
                      c.errors[1].value,
                      c.errors[2].value,
                      c.errors[3].value,
                    ],
                    onChange: (i, str) => c.onDropdownChanged(i, str),
                    onClear: (i) => c.onDropdownCleared(i),
                  )),
              const Expanded(child: SizedBox()),
              Obx(() => LocationNavigation(
                    bottomHeight: c.app.bottomHeight.value,
                    onBackTap: () => c.onBackTapped(),
                    onNextTap: () => c.onNextTapped(),
                  )),
            ],
          ),
        );
      },
    );
  }
}
