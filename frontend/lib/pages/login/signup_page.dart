// 🐦 Flutter imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:frontend/core/app_theme.dart';
import 'package:frontend/core/app_images.dart';

// 🌎 Project imports:
import '../../core/app_textstyle.dart';
import '../../services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  AuthService authService = AuthService();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.bone,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery
                  .of(context)
                  .size
                  .height,
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
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.29,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Register below",
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
                    controller: _nameController,
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
                          Icons.person_outline,
                          color: AppTheme.ocean,
                        ),
                        hintText: "Name",
                        hintStyle:
                        TextStyle(color: Colors.black26, fontSize: 17)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.04,
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.04,
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.04,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _confirmPasswordController,
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
                        hintText: "Confirm your password",
                        hintStyle: const TextStyle(
                            color: Colors.black26, fontSize: 17)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
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
                            if (_passwordController.text
                                .trim()
                                .isEmpty ||
                                _confirmPasswordController.text
                                    .trim()
                                    .isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                      Text("Please enter a password")));
                            } else {
                              if (_passwordController.text.trim() !=
                                  _confirmPasswordController.text.trim()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                        Text("Password doesn't match")));
                              } else if (_passwordController.text.trim() ==
                                  _confirmPasswordController.text.trim() ||
                                  _nameController.text
                                      .trim()
                                      .isNotEmpty || _emailController.text
                                  .trim()
                                  .isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Password match")));
                                authService.signUpUser(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Sign Up',
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
