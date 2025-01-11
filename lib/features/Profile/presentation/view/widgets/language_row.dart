import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flower_app/main.dart';
import 'package:flutter/material.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.language,
          size: 18,
          color: AppColors.greyColor,
        ),
        const SizedBox(width: 3),
        Text(
          S.of(context).language,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.greyColor,
          ),
        ),
        const Spacer(),
        DropdownButton<String>(
          borderRadius: Localizations.localeOf(context).languageCode == 'ar'
              ? BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
          value: Localizations.localeOf(context).languageCode,
          icon:
              const Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
          underline: SizedBox(),
          dropdownColor: AppColors.backgroundColor,
          onChanged: (String? value) {
            if (value != null) {
              if (value == 'ar') {
                FlowerApp.setLocale(context, Locale('ar'));
              } else {
                FlowerApp.setLocale(context, Locale('en'));
              }
            }
          },
          items: [
            DropdownMenuItem<String>(
              value: 'ar',
              child: Text(
                S.of(context).arabic,
                style: TextStyle(color: AppColors.primaryColor, fontSize: 14),
              ),
            ),
            DropdownMenuItem<String>(
              value: 'en',
              child: Text(
                S.of(context).english,
                style: TextStyle(color: AppColors.primaryColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
