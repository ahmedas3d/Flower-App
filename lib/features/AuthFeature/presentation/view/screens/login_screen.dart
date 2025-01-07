import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_state.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flower_app/main.dart';
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
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          S.of(context).login,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            offset: const Offset(0, 35),
            elevation: 10,
            color: AppColors.backgroundColor,
            onSelected: (String value) {
              Locale currentLocale = Localizations.localeOf(context);
              if (value == 'ar') {
                FlowerApp.setLocale(context, Locale('ar'));
              } else {
                FlowerApp.setLocale(context, Locale('en'));
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'ar',
                  child: Text(S.of(context).arabic),
                ),
                PopupMenuItem<String>(
                  value: 'en',
                  child: Text(S.of(context).english),
                ),
              ];
            },
            icon: const Icon(Icons.translate),
          ),
        ],
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
                      label: S.of(context).email,
                      hint: S.of(context).enteryourEmail,
                    ),
                    const SizedBox(height: 20),
                    customTextField(
                      controller: password,
                      label: S.of(context).password,
                      hint: S.of(context).enteryourPassword,
                      visibleIcon: Icons.visibility_off,
                      hiddenIcon: Icons.visibility,
                      isObscured: _isObscured,
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
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
                            Text(
                              S.of(context).rememberpassword,
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
                          child: Text(
                            S.of(context).forgotpassword,
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
                      title: S.of(context).login,
                      onTap: () {
                        if (_formLoginKey.currentState!.validate()) {
                          context.read<AuthCubit>().signIn(
                                email: email.text,
                                password: password.text,
                              );
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
                    const SizedBox(height: 15),
                    customButton(
                      title: S.of(context).continuewithguest,
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
                        Text(
                          S.of(context).donthaveanaccount,
                          style: TextStyle(
                              fontSize: 15, color: AppColors.textColor1),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.signUpScreen);
                          },
                          child: Text(
                            S.of(context).signup,
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
