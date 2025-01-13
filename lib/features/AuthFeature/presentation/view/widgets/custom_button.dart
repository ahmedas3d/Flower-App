import 'package:flutter/material.dart';

Widget customButton({
  required String title,
  required VoidCallback onTap,
  required Color color,
  required Color textColor,
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
            width: 2,
          )),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
