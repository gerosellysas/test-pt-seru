import 'package:flutter/material.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/hues.constant.dart';

class Fonts {
  static TextStyle normal({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Inter",
      );

  static TextStyle semiBold({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w600,
        fontFamily: "Inter",
      );

  static TextStyle bold({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w700,
        fontFamily: "Inter",
      );

  static TextStyle italic({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontFamily: "Inter",
      );

  static TextStyle semiBoldItalic({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
        fontFamily: "Inter",
      );
}
