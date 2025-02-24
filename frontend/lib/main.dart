// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'core/app_theme.dart';
import 'pages/login/login_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fintrack',
      color: AppTheme.seashell,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
