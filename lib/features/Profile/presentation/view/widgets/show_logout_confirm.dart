import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

void showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          textAlign: TextAlign.center,
          S.of(context).confirmLogout,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          textAlign: TextAlign.center,
          S.of(context).areYouSureYouWantToLogout,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        actions: [
          customButton(
            title: S.of(context).cancel,
            onTap: () => Navigator.of(context).pop(),
            color: AppColors.backgroundColor,
            textColor: AppColors.textColor1,
            borderColor: AppColors.textColor3,
          ),
          const SizedBox(height: 10),
          customButton(
              title: S.of(context).logout,
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.loginScreen, (route) => false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).logoutSuccessfully,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: AppColors.greenColor,
                  ),
                );
              },
              color: AppColors.primaryColor,
              textColor: AppColors.textColor2),
        ],
      );
    },
  );
}
