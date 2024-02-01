import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pt_seru/presentation/components/widgets/widgets.components.dart';

class LocationField extends StatelessWidget {
  final Future<List<String>> Function(int, String)? items;
  final void Function(int)? onTap;
  final void Function(int, String)? onChange;

  const LocationField({
    super.key,
    this.items,
    this.onTap,
    this.onChange,
  });

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
          onTap: () => onTap!(i),
          onChange: (str) => onChange!(i, str!),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          _fields[0],
          SizedBox(height: 16.h),
          _fields[1],
          SizedBox(height: 16.h),
          _fields[2],
          SizedBox(height: 16.h),
          _fields[3],
        ],
      ),
    );
  }
}
