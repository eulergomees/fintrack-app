// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'app_theme.dart';

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle boldTextCarbon= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppTheme.carbon,
    fontFamily: 'Gotham',
  );
  static TextStyle boldTextSeashell = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppTheme.seashell,
    fontFamily: 'Gotham',
    shadows: <Shadow>[
      Shadow(
        offset: const Offset(1.0, 1.0),
        blurRadius: 3,
        color: AppTheme.seashell.withAlpha(90),
      ),
    ],
  );
  static TextStyle boldTitleAlpha90 = TextStyle(
      fontWeight: FontWeight.w800,
      color: AppTheme.carbon.withAlpha(90),
      fontSize: 18);
  static const TextStyle normalText =
  TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
}