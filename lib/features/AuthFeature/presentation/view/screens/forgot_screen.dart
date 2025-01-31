import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formForgotKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          S.of(context).forgetPassword,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Form(
          key: _formForgotKey,
          child: Column(
            children: [
              Text(
                S.of(context).forgetPassword,
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
                S.of(context).pleaseEnterYourEmail,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              customTextField(
                controller: email,
                label: S.of(context).email,
                hint: S.of(context).enteryourEmail,
              ),
              const SizedBox(height: 35),
              customButton(
                title: S.of(context).confirm,
                color: AppColors.primaryColor,
                textColor: AppColors.textColor2,
                onTap: () {
                  if (_formForgotKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.emailVerificationScreen);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
