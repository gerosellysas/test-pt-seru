import 'package:flutter/material.dart';

class Hues {
  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFE1E4E7),
    100: Color(0xFFB4BAC3),
    200: Color(0xFF838D9C),
    300: Color(0xFF515F74),
    400: Color(0xFF2B3C56),
    500: Color(_primaryValue),
    600: Color(0xFF051732),
    700: Color(0xFF04132B),
    800: Color(0xFF030F24),
    900: Color(0xFF020817),
  });

  static const int _primaryValue = 0xFF061A38;
  static const Color white = Color(0xFFFDFDFD);
  static const Color black = Color(0xFF1A1B23);
  static const Color grey = Color(0xFFC4C5C7);
  static const Color red = Color(0xFFEE2128);
  static const Color blue = Color(0xFF164396);
}
