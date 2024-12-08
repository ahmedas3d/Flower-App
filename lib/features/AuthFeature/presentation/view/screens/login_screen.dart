import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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

  bool _isLoading = false;
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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignInLoadingState) {
            setState(() {
              _isLoading = true;
            });
          } else if (state is SignInSuccessState) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBar);
          } else if (state is SignInErrorState) {
            setState(() {
              _isLoading = false;
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
          inAsyncCall: _isLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formLoginKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
                          _isObscured =
                              !_isObscured; // Toggle password visibility
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
                          context.read<AuthCubit>().signIn(
                                email: email.text,
                                password: password.text,
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Please fill all fields'),
                              backgroundColor: AppColors.primaryColor,
                            ),
                          );
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
                          style: TextStyle(
                              fontSize: 15, color: AppColors.textColor1),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.signUpScreen);
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
        ),
      ),
    );
  }
}
