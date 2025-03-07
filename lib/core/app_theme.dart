// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color ocean = Color(0xFF1e88e5); // Azul forte
  static const Color carbon = Color(0xFF212121); // Cinza escuro (quase preto)
  static const Color seashell = Color(0xFFFFF3E9); // Bege claro
  static const Color bone = Color(0xFFF8FAF0); // Verde muito claro

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ocean,
      scaffoldBackgroundColor: bone,
      colorScheme: const ColorScheme(
        primary: ocean,
        secondary: seashell,
        surface: Colors.white,
        background: bone,
        error: Colors.redAccent,
        onPrimary: Colors.white,
        onSecondary: carbon,
        onSurface: carbon,
        onBackground: carbon,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: carbon),
        bodyMedium: TextStyle(color: carbon),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ocean,
        foregroundColor: Colors.white,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: ocean,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
