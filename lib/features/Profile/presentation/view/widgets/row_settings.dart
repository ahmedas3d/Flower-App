import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

class RowSettings extends StatelessWidget {
  RowSettings({
    super.key,
    this.icon,
    required this.title,
    this.iconTwo,
    required this.color,
    required this.onPressed,
  });
  final IconData? icon;
  final IconData? iconTwo;
  final String title;
  final Color color;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.greyColor,
        ),
        const SizedBox(width: 3),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.greyColor,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            iconTwo,
            size: 18,
            color: color,
          ),
        ),
      ],
    );
  }
}
