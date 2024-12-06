import 'package:flower_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_small_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();

  bool rememberPassword = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  double passwordStrength = 0; // Password strength progress
  // Function to check the password strength
  void checkPasswordStrength(String password) {
    int score = 0;

    // At least one uppercase letter
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    // At least one lowercase letter
    if (RegExp(r'[a-z]').hasMatch(password)) score++;
    // At least one digit
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    // At least one special character
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;
    // Minimum 8 characters
    if (password.length >= 8) score++;

    setState(() {
      passwordStrength = score / 5; // Max score is 5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formSignUpKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customSmallTextField(
                      label: 'First Name',
                      hint: 'Enter your First Name',
                    ),
                    customSmallTextField(
                      label: 'Last Name',
                      hint: 'Enter your Last Name',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                customTextField(
                  controller: email,
                  label: 'Email',
                  hint: 'Enter your Email',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customSmallTextField(
                      controller: password,
                      label: 'Password',
                      hint: 'Enter your Password',
                      isObscured: true,
                      onChanged: (value) {
                        checkPasswordStrength(value);
                      },
                    ),
                    customSmallTextField(
                      controller: confirmPassword,
                      label: 'Confirm Password',
                      hint: 'Confirm Password',
                      isObscured: true,
                      isConfirmPassword: true,
                      confirmPasswordController: password,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Password Strength Progress Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 165, // Set the width of the progress bar
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(5),
                        value: passwordStrength,
                        minHeight: 5,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          passwordStrength == 1.0
                              ? Colors.green
                              : passwordStrength >= 0.6
                                  ? Colors.orange
                                  : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                customTextField(
                  controller: phone,
                  label: 'Phone Number',
                  hint: 'Enter your Phone Number',
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          value: isMaleSelected,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isMaleSelected = newValue ?? false;
                              if (isMaleSelected) isFemaleSelected = false;
                            });
                          },
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Checkbox(
                          activeColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          value: isFemaleSelected,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isFemaleSelected = newValue ?? false;
                              if (isFemaleSelected) isMaleSelected = false;
                            });
                          },
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Creating an account, you agree to our',
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                customButton(
                  title: 'Sign Up',
                  onTap: () {
                    if (_formSignUpKey.currentState?.validate() ?? false) {
                      Navigator.pop(context);
                    }
                  },
                  color: AppColors.primaryColor,
                  textColor: AppColors.textColor2,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style:
                          TextStyle(fontSize: 15, color: AppColors.textColor1),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign in",
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
