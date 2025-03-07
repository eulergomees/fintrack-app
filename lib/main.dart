import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/app_theme.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      theme: AppTheme.lightTheme,
      home: RouterPage(),
    );
  }
}

class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage(user: snapshot.data!,);
        } else {
          return LoginPage();
        }
      },
    );
  }
}
