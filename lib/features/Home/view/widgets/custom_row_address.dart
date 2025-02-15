import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomRowAddress extends StatelessWidget {
  const CustomRowAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 18,
          color: AppColors.greyColor,
        ),
        Text(
          '${S.of(context).deliverTo} ',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.greyColor,
          ),
        ),
        Row(
          children: [
            const Text(
              '2XVP+XC - Sheikh Zayed ',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor1,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 24,
              color: AppColors.primaryColor,
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ],
    );
  }
}
