import 'package:flutter/material.dart';
import 'package:flower_app/core/constants.dart';

Widget customNameTextField({
  required String label,
  required String hint,
  TextEditingController? controller,
}) {
  return SizedBox(
    width: 165,
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
          return 'Please enter a valid name';
        }
        return null;
      },
      style: const TextStyle(color: AppColors.textColor1),
      decoration: InputDecoration(
        label: Text(
          label,
          textDirection: TextDirection.rtl,
        ),
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
