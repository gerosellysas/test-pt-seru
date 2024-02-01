import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class FormNameField extends StatelessWidget {
  final List<TextEditingController>? controllers;
  final List<FocusNode>? focuses;
  final void Function(int, String)? onChange;
  final void Function(int, String)? onSubmit;

  const FormNameField({
    super.key,
    this.controllers,
    this.focuses,
    this.onChange,
    this.onSubmit,
  })  : assert(
          controllers != null && controllers.length == 2,
          "controllers length should be 2 and can't be null",
        ),
        assert(
          focuses != null && focuses.length == 2,
          "focuses length should be 2 and can't be null",
        );

  List<String> get _labels => ["First name", "Last name"];

  List<Widget> get _fields => List.generate(
        _labels.length,
        (i) => InputField(
          w: 164.w,
          controller: controllers![i],
          focusNode: focuses![i],
          capitalization: TextCapitalization.words,
          labelText: _labels[i],
          formatter: [
            FilteringTextInputFormatter.deny(RegExp(r'^[ ]')),
            FilteringTextInputFormatter(
              RegExp(r'\s+'),
              allow: false,
              replacementString: ' ',
            ),
          ],
          onChange: (str) => onChange!(i, str),
          onSubmit: (str) => onSubmit!(i, str),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _fields,
    );
  }
}
