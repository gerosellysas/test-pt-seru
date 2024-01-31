import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/form.controller.dart';

class FormScreen extends GetView<FormController> {
  const FormScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {},
      builder: (_) {
        return const ScaffoldView();
      },
    );
  }
}
