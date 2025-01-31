import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/generated/l10n.dart';
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
        title: Text(
          S.of(context).resetPassword,
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
              Text(
                S.of(context).resetPassword,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor1,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                S.of(context).passwordDescription,
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
                label: S.of(context).newPassword,
                hint: S.of(context).enteryourNewPassword,
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
                label: S.of(context).confirmPassword,
                hint: S.of(context).enteryourConfirmPassword,
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
                title: S.of(context).confirm,
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
