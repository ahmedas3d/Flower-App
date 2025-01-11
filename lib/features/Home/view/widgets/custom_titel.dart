import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

class customTitle extends StatelessWidget {
  const customTitle({
    super.key,
    required this.title,
    this.onTap,
    this.viewAll,
  });

  final String title;
  final String? viewAll;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor1,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              viewAll ?? '',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
