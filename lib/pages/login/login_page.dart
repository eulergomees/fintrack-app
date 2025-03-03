// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import '../../services/auth_service.dart';

// 🌎 Project imports: show AuthService
import 'package:frontend/core/app_theme.dart';
import 'package:frontend/core/app_images.dart';
import 'package:frontend/pages/login/signup_page.dart';
import 'package:frontend/shared/my_snackbar.dart';
import '../../core/app_textstyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.bone,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 8,
                      child: Image.asset(
                        AppImages.logo,
                        height: MediaQuery.of(context).size.height * 0.29,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Login or Signup",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _emailController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -1),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.ocean)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.ocean)),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: AppTheme.ocean,
                        ),
                        hintText: "Email",
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 17)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: isObscureText,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: -1),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.ocean)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.ocean)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: AppTheme.ocean,
                        ),
                        suffixIcon: InkWell(
                          //InkWell Or GestureDetector
                          onTap: () {
                            isObscureText = !isObscureText;
                            setState(() {});
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppTheme.carbon,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Colors.black26, fontSize: 17)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(AppTheme.ocean),
                          ),
                          onPressed: () {
                            _authService
                                .loginUser(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((String? error) {
                                  if (error != null) {
                                    showSnackBar(context: context, text: error);
                                  } else {
                                    Navigator.pushNamed(context, '/home');
                                  }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Login',
                              style: AppTextStyle.boldTextSeashell
                                  .copyWith(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: AppTheme.carbon,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: AppTheme.carbon,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
