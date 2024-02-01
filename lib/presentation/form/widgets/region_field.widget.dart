import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class FormRegionField extends StatelessWidget {
  final Future<List<String>> Function(int, String)? items;
  final List<FocusNode>? searchFocuses;
  final void Function(int, String)? onChange;
  final void Function(int)? onSearchTap;
  

  const FormRegionField({
    super.key,
    this.items,
    this.searchFocuses,
    this.onChange,
    this.onSearchTap,
  }) : assert(
          searchFocuses != null && searchFocuses.length == 4,
          "searchFocuses length should be 2 and can't be null",
        );

  List<String> get _labels => [
        "Province",
        "City/Regency",
        "District",
        "Sub-district",
      ];

  List<Widget> get _fields => List.generate(
        _labels.length,
        (i) => DropdownField(
          items: items != null ? (item) => items!(i, item) : null,
          labelText: _labels[i],
          searchFoscus: searchFocuses![i],
          onChange: (str) => onChange!(i, str!),
          onSearchTap: () => onSearchTap!(i),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fields[0],
        SizedBox(height: 16.h),
        _fields[1],
        SizedBox(height: 16.h),
        _fields[2],
        SizedBox(height: 16.h),
        _fields[3],
      ],
    );
  }
}
