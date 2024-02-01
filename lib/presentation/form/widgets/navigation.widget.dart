import 'package:flutter/material.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class FormNavigation extends StatelessWidget {
  final void Function()? onTap;

  const FormNavigation({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: "Next",
      onTap: onTap,
    );
  }
}
