// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  static const Color mint= Color(0xFFA5F2A1);
  static const Color olive = Color(0xFF43483E);
  static const Color seashell = Color(0xFFFFF3E9);
  static const Color bone = Color(0xFFF8FAF0);

  static const Map<int, Color> colorCodes = {
    50: Color.fromRGBO(165, 242, 161, .1),
    100: Color.fromRGBO(165, 242, 161, .2),
    200: Color.fromRGBO(165, 242, 161, .3),
    300: Color.fromRGBO(165, 242, 161, .4),
    400: Color.fromRGBO(165, 242, 161, .5),
    500: Color.fromRGBO(165, 242, 161, .6),
    600: Color.fromRGBO(165, 242, 161, .7),
    700: Color.fromRGBO(165, 242, 161, .8),
    800: Color.fromRGBO(165, 242, 161, .9),
    900: Color.fromRGBO(165, 242, 161, 1),
  };

  static const MaterialColor mintMaterial =
  MaterialColor(0xFFA5F2A1, colorCodes);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: mintMaterial,
    primaryColorLight: mint,
    primaryColor: seashell,
    fontFamily: 'Gotham',
  );
}