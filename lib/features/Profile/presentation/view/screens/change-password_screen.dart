import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formResetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
        title: Text(S.of(context).resetPassword),
      ),
      body: Form(
        key: _formResetPasswordKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              customTextField(
                controller: currentPassword,
                label: S.of(context).currentpassword,
                hint: S.of(context).enteryourCurrentPassword,
              ),
              const SizedBox(
                height: 20,
              ),
              customTextField(
                controller: newPassword,
                label: S.of(context).newPassword,
                hint: S.of(context).enteryourNewPassword,
              ),
              const SizedBox(
                height: 20,
              ),
              customTextField(
                controller: confirmPassword,
                label: S.of(context).confirmPassword,
                hint: S.of(context).confirmPassword,
              ),
              const SizedBox(
                height: 40,
              ),
              customButton(
                title: S.of(context).update,
                onTap: () {
                  if (_formResetPasswordKey.currentState!.validate()) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(S.of(context).pleaseFillAllFields),
                        backgroundColor: AppColors.primaryColor,
                      ),
                    );
                  }
                },
                color: AppColors.primaryColor,
                textColor: AppColors.textColor2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
