import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class FormBiodataField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focus;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;

  const FormBiodataField({
    super.key,
    this.controller,
    this.focus,
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller!,
      focusNode: focus!,
      capitalization: TextCapitalization.sentences,
      inputAction: TextInputAction.done,
      maxLength: 300,
      maxLines: 5,
      formatter: [
        FilteringTextInputFormatter.deny(RegExp(r'^[ ]')),
      ],
      labelText: "Biodata",
      hintText: "Write something about yourself",
      onChange: onChange,
      onSubmit: onSubmit,
    );
  }
}
