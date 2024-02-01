import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class InputField extends StatelessWidget {
  final double? w;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextCapitalization? capitalization;
  final TextInputAction? inputAction;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? formatter;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool? error;
  final bool? showCounter;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;

  const InputField({
    super.key,
    this.w,
    this.controller,
    this.focusNode,
    this.capitalization,
    this.inputAction,
    this.maxLength,
    this.maxLines,
    this.formatter,
    this.labelText,
    this.hintText,
    this.errorText,
    this.error,
    this.showCounter = false,
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? 352.w,
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        cursorWidth: 1.75,
        keyboardType: TextInputType.text,
        magnifierConfiguration: TextMagnifierConfiguration.disabled,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        style: Fonts.normal(),
        textAlign: TextAlign.start,
        textCapitalization: capitalization ?? TextCapitalization.none,
        textInputAction: inputAction ?? TextInputAction.next,
        inputFormatters: formatter,
        onChanged: onChange,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: error == true ? Hues.red : Hues.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: error == true ? Hues.red : Hues.blue,
              width: 1.5,
            ),
          ),
          isDense: true,
          alignLabelWithHint: true,
          counterStyle: Fonts.normal(
            color: Hues.black.withOpacity(0.36),
            size: 12.sp,
          ),
          labelText: labelText,
          labelStyle: Fonts.italic(color: Hues.grey),
          hintText: hintText,
          hintStyle: Fonts.italic(color: Hues.grey),
          floatingLabelStyle: Fonts.italic(color: Hues.blue),
        ),
      ),
    );
  }
}
