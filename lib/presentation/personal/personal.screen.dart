import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/personal.controller.dart';
import 'widgets/personal.widgets.dart';

class PersonalScreen extends GetView<PersonalController> {
  const PersonalScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {},
      builder: (c) {
        return ScaffoldView(
          topBar: TopBar(
            title: "Personal data",
            onBackTap: () {},
          ),
          view: Column(
            children: [
              PersonalNameField(
                controllers: [c.fieldControllers[0], c.fieldControllers[1]],
                onChange: (i, str) => c.onFieldChanged(i, str),
                onSubmit: (i, str) => c.onFieldSubmitted(i, str),
              ),
              PersonalBiodataField(
                controller: c.fieldControllers[2],
                onChange: (str) => c.onFieldChanged(2, str),
                onSubmit: (str) => c.onFieldSubmitted(2, str),
              ),
              const Expanded(child: SizedBox()),
              Obx(() => PersonalNavigation(
                    bottomHeight: c.app.bottomHeight.value,
                    onTap: () => c.onButtonTapped(),
                  )),
            ],
          ),
        );
      },
    );
  }
}
