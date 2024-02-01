import 'dart:math' as math;

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';

class DropdownField extends StatelessWidget {
  final Future<List<String>> Function(String)? items;
  final String? labelText;
  final bool? error;
  final FocusNode? searchFoscus;
  final void Function(String?)? onChange;
  final void Function()? onSearchTap;

  const DropdownField({
    super.key,
    this.items,
    this.labelText,
    this.error,
    this.searchFoscus,
    this.onChange,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      asyncItems: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
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
          alignLabelWithHint: true,
          isDense: true,
          labelText: labelText,
          labelStyle: Fonts.italic(color: Hues.grey),
          hintText: "Please select your ${labelText!.toLowerCase()}",
          hintStyle: Fonts.italic(color: Hues.grey),
          floatingLabelStyle: Fonts.italic(color: Hues.blue),
        ),
      ),
      dropdownButtonProps: DropdownButtonProps(
        icon: Container(
          height: 16.w,
          width: 16.w,
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: -(math.pi / 2),
            child: SvgPicture.asset(
              Images.back,
              fit: BoxFit.fill,
              colorFilter: const ColorFilter.mode(
                Hues.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        highlightColor: Hues.grey.withOpacity(0.24),
        splashColor: Hues.grey.withOpacity(0.24),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        constraints: BoxConstraints(maxHeight: 240.h),
        menuProps: MenuProps(
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.circular(4.w),
          elevation: 0,
        ),
        searchFieldProps: TextFieldProps(
          focusNode: searchFoscus,
          cursorWidth: 1.75,
          enableInteractiveSelection: false,
          textInputAction: TextInputAction.search,
          style: Fonts.normal(),
          onTap: onSearchTap,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Hues.grey,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Hues.blue,
                width: 1.5,
              ),
            ),
            isDense: true,
            alignLabelWithHint: true,
            hintText: "Find ${labelText!.toLowerCase()}",
            hintStyle: Fonts.italic(color: Hues.grey),
          ),
        ),
        containerBuilder: (ctx, popupWidget) {
          return Column(
            children: [
              SizedBox(height: 12.h),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: Hues.white,
                    borderRadius: BorderRadius.circular(4.w),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Hues.black.withOpacity(0.32),
                      ),
                    ],
                  ),
                  child: popupWidget,
                ),
              ),
            ],
          );
        },
        emptyBuilder: (context, result) {
          return Column(
            children: [
              Center(
                child: Text(
                  result.isNotEmpty
                      ? "No result found for \"$result\""
                      : "No data",
                  style: Fonts.italic(size: 12.sp, color: Hues.red),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          );
        },
        loadingBuilder: (context, _) {
          return Column(
            children: [
              SizedBox(height: 8.h),
              const Center(child: CircularProgressIndicator()),
              const Expanded(child: SizedBox()),
            ],
          );
        },
      ),
      onChanged: onChange,
    );
  }
}
