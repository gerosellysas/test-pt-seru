import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class PersonalBiodataField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;

  const PersonalBiodataField({
    super.key,
    this.controller,
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: InputField(
        controller: controller!,
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
      ),
    );
  }
}
