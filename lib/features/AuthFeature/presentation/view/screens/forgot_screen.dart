import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_state.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formForgotKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          S.of(context).forgetPassword,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                style: const TextStyle(
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
                style: const TextStyle(
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
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordLoadingState) {
                    loading = true;
                  } else if (state is ResetPasswordSuccessState) {
                    loading = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please check your email'),
                      ),
                    );
                  } else if (state is ResetPasswordErrorState) {
                    loading = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                child: Builder(builder: (context) {
                  if (loading) {
                    return const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    );
                  }
                  return customButton(
                    title: S.of(context).confirm,
                    color: AppColors.primaryColor,
                    textColor: AppColors.textColor2,
                    onTap: () {
                      if (_formForgotKey.currentState!.validate()) {
                        context
                            .read<AuthCubit>()
                            .resetPassword(email: email.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your email'),
                          ),
                        );
                      }
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
