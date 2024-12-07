import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_small_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();
  bool loading = false;
  bool rememberPassword = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            setState(() {
              loading = true;
            });
          } else if (state is SignUpSuccessState) {
            setState(() {
              loading = false;
            });
            Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBar);
          } else if (state is SignUpErrorState) {
            setState(() {
              loading = false;
            });
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
                        customSmallTextField(
                          controller: firstName,
                          label: 'First Name',
                          hint: 'Enter your First Name',
                        ),
                        customSmallTextField(
                          controller: lastName,
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
                        ),
                        customSmallTextField(
                          controller: confirmPassword,
                          label: 'Confirm Password',
                          hint: 'Confirm Password',
                          isObscured: true,
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
                        const Spacer(
                          flex: 2,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.primaryColor,
                              shape: const CircleBorder(),
                              value: isMaleSelected,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isMaleSelected = newValue ?? false;
                                  // When Male is selected, unselect Female
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
                                  // When Female is selected, unselect Male
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
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                        if ((_formSignUpKey.currentState?.validate() ??
                                false) &&
                            (isMaleSelected || isFemaleSelected) &&
                            password.text == confirmPassword.text) {
                          context.read<AuthCubit>().signUp(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                email: email.text,
                                password: password.text,
                                rePassword: confirmPassword.text,
                                phone: phone.text,
                                gender: (isMaleSelected) ? "male" : "female",
                              );
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
                          style: TextStyle(
                              fontSize: 15, color: AppColors.textColor1),
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
        ),
      ),
    );
  }
}
