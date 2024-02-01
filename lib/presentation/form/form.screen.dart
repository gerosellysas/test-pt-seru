import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/form.controller.dart';
import 'widgets/form.widgets.dart';

class FormScreen extends GetView<FormController> {
  const FormScreen({Key? key}) : super(key: key);
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
          view: Obx(() => FormView(
                nameField: FormNameField(
                  controllers: [c.fieldControllers[0], c.fieldControllers[1]],
                  focuses: [c.fieldFocuses[0], c.fieldFocuses[1]],
                  onChange: (i, str) {},
                  onSubmit: (i, str) => c.onFieldSubmitted(i, str),
                ),
                regionField: FormRegionField(
                  searchFocuses: c.dropdownSearchFocuses,
                  onTap: (i) => (),
                  onChange: (i, str) => (),
                ),
                biodataField: FormBiodataField(
                  controller: c.fieldControllers[2],
                  focus: c.fieldFocuses[2],
                  onChange: (str) => (),
                  onSubmit: (str) => c.onFieldSubmitted(2, str),
                ),
                navigation: const FormNavigation(),
                bottomHeight: c.bottomHeight.value,
              )),
        );
      },
    );
  }
}
