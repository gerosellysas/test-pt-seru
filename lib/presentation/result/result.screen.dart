import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/widgets/widgets.components.dart';
import 'controllers/result.controller.dart';
import 'widgets/result.widgets.dart';

class ResultScreen extends GetView<ResultController> {
  const ResultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {},
      builder: (c) {
        return ScaffoldView(
          topBar: const TopBar(title: "Result"),
          view: Column(
            children: [
              ResultReview(
                result: c.app.result,
              ),
              const Expanded(child: SizedBox()),
              ResultNavigation(
                onEditTap: () => c.onEditTapped(),
              ),
            ],
          ),
        );
      },
    );
  }
}
