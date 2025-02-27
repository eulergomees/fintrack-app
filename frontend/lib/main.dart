// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// Firebase imports:
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// 🌎 Project imports:
import 'core/app_theme.dart';
import 'pages/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
