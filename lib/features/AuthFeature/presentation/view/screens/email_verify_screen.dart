import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_state.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/routes.dart';
import '../../viewmodel/auth_cubit.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).emailVerify,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is verfiyEmailState_success) {
            Navigator.pushNamed(context, AppRoutes.bottomNavBar);
          } else if (state is verfiyEmailState_error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            children: [
              Text(
                S.of(context).emailVerification,
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
                S.of(context).sendCodeIntoYourEmail,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () {
                    context.read<AuthCubit>().checker_email();
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        S.of(context).checkYourEmail,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textColor2,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).didntReceiveCode,
                    style: TextStyle(fontSize: 15, color: AppColors.textColor1),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthCubit>().verify_email();
                    },
                    child: Text(
                      S.of(context).resend,
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
    );
  }
}
