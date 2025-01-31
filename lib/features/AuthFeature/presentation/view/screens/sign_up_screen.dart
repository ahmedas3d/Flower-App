import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_small_password_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_small_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/social_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_state.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();
  bool loading = false;
  bool rememberPassword = false;
  final ValueNotifier<String> genderNotifier = ValueNotifier<String>('male');

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: true,
        title: Text(
          S.of(context).signup,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            loading = true;
          } else if (state is SignUpSuccessState) {
            loading = false;
            context.read<AuthCubit>().setEmailandpassword(
                  email.text,
                  password.text,
                );

            context.read<AuthCubit>().verify_email();
            Navigator.pushReplacementNamed(
                context, AppRoutes.emailVerificationScreen);
          } else if (state is SignUpErrorState) {
            loading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: AppColors.primaryColor,
              ),
            );
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: loading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formSignUpKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customNameTextField(
                          controller: firstName,
                          label: S.of(context).firstName,
                          hint: S.of(context).enteryourfirstname,
                        ),
                        customNameTextField(
                          controller: lastName,
                          label: S.of(context).lastName,
                          hint: S.of(context).enteryourlastname,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    customTextField(
                      controller: email,
                      label: S.of(context).email,
                      hint: S.of(context).enteryourEmail,
                    ),
                    const SizedBox(height: 20),
                    customPasswordField(
                      controller: password,
                      label: S.of(context).password,
                      hint: S.of(context).enteryourPassword,
                      isObscured: true,
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 20),
                    customPasswordField(
                      controller: confirmPassword,
                      label: S.of(context).confirmPassword,
                      hint: S.of(context).confirmPassword,
                      isObscured: true,
                      validator: (value) =>
                          validateConfirmPassword(value, password.text),
                    ),
                    const SizedBox(height: 20),
                    customTextField(
                      controller: phone,
                      label: S.of(context).phoneNumber,
                      hint: S.of(context).enteryourPhoneNumber,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          S.of(context).gender,
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        ValueListenableBuilder<String>(
                          valueListenable: genderNotifier,
                          builder: (context, gender, child) {
                            return Row(
                              children: [
                                Checkbox(
                                  activeColor: AppColors.primaryColor,
                                  shape: const CircleBorder(),
                                  value: gender == 'male',
                                  onChanged: (bool? newValue) {
                                    if (newValue ?? false) {
                                      genderNotifier.value = 'male';
                                    }
                                  },
                                ),
                                Text(
                                  S.of(context).male,
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Checkbox(
                                  activeColor: AppColors.primaryColor,
                                  shape: const CircleBorder(),
                                  value: gender == 'female',
                                  onChanged: (bool? newValue) {
                                    if (newValue ?? false) {
                                      genderNotifier.value = 'female';
                                    }
                                  },
                                ),
                                Text(
                                  S.of(context).female,
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).creatingAnAccountYouAgreeToOur,
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          S.of(context).termsAndConditions,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    socialButton(
                      title: S.of(context).google,
                      onTap: () {},
                      color: Colors.white,
                      textColor: AppColors.textColor1,
                      icon: FontAwesomeIcons.google,
                      borderColor: Colors.grey[300],
                    ),
                    const SizedBox(height: 8),
                    customButton(
                      title: S.of(context).signup,
                      onTap: () {
                        if (_formSignUpKey.currentState?.validate() ?? false) {
                          if (password.text != confirmPassword.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(S.of(context).passwordsDoNotMatch),
                                backgroundColor: AppColors.primaryColor,
                              ),
                            );
                          } else {
                            context
                                .read<AuthCubit>()
                                .setEmailandpassword(email.text, password.text);
                            context.read<AuthCubit>().signUp(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  rePassword: confirmPassword.text,
                                  phone: phone.text,
                                  gender: genderNotifier.value == "male"
                                      ? "male"
                                      : "female",
                                );
                          }
                        }
                      },
                      color: AppColors.primaryColor,
                      textColor: AppColors.textColor2,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).alreadyHaveAnAccount,
                          style: TextStyle(
                              fontSize: 15, color: AppColors.textColor1),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            " " + S.of(context).login,
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
        ),
      ),
    );
  }
}
