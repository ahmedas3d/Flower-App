import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formResetPasswordKey = GlobalKey<FormState>();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Password',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Form(
          key: _formResetPasswordKey,
          child: Column(
            children: [
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor1,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Password must not be empty and must contain\n 6 characters with upper case letter and one\n number at least ',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customTextField(
                controller: password,
                label: 'New Password',
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
              const SizedBox(
                height: 20,
              ),
              customTextField(
                controller: confirmPassword,
                label: 'Confirm Password',
                hint: 'Confirm password',
                visibleIcon: Icons.visibility_off,
                hiddenIcon: Icons.visibility,
                isObscured: _isObscured,
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle password visibility
                  });
                },
              ),
              const SizedBox(
                height: 35,
              ),
              customButton(
                title: 'Confirm',
                onTap: () {},
                color: AppColors.primaryColor,
                textColor: AppColors.textColor2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
