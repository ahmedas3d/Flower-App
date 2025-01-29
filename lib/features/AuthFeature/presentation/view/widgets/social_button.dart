import 'package:flutter/material.dart';

Widget socialButton({
  required String title,
  required VoidCallback onTap,
  required Color color,
  required Color textColor,
  required IconData icon,
  Color? borderColor,
  double size = 50,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: size,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textColor,
            size: 18,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
