import 'package:flutter/material.dart';
import 'package:flower_app/core/constants.dart';

Widget customSmallTextField({
  required String label,
  required String hint,
  bool isObscured = true,
  TextEditingController? controller,
}) {
  return SizedBox(
    width: 165,
    child: TextFormField(
      controller: controller,
      obscureText: isObscured, // Ensure this handles text obscuring
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      style: const TextStyle(color: AppColors.textColor1),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
          color: AppColors.textColor3,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textColor3, fontSize: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textColor3),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textColor3),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
