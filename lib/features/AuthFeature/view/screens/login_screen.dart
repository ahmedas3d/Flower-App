import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();

  bool rememberPassword = false;

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formLoginKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              children: [
                customTextField(
                  controller: email,
                  label: 'Email',
                  hint: 'Enter your Email',
                ),
                const SizedBox(height: 20),
                customTextField(
                  controller: password,
                  label: 'Password',
                  hint: 'Enter your password',
                  visibleIcon: Icons.visibility_off,
                  hiddenIcon: Icons.visibility,
                  isObscured: _isObscured,
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured; // Toggle password visibility
                    });
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                rememberPassword = value;
                              });
                            }
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                        const Text(
                          'Remember password',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.forgotPasswordScreen);
                      },
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.greyColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                customButton(
                  title: 'Login',
                  onTap: () {
                    if (_formLoginKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.bottomNavBar);
                    }
                  },
                  color: AppColors.primaryColor,
                  textColor: AppColors.textColor2,
                ),
                const SizedBox(height: 15),
                customButton(
                  title: 'Continue with gust',
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.bottomNavBar);
                  },
                  color: AppColors.backgroundColor,
                  textColor: AppColors.textColor3,
                  borderColor: AppColors.textColor3,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontSize: 15, color: AppColors.textColor1),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpScreen);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
