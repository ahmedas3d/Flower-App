import 'package:flutter/material.dart';
import 'package:flower_app/core/constants.dart';

Widget customPasswordField({
  required String label,
  required String hint,
  bool isObscured = false,
  TextEditingController? controller,
  Function(String)? onChanged,
  String? Function(String?)? validator,
}) {
  final ValueNotifier<bool> isObscuredNotifier =
      ValueNotifier<bool>(isObscured);

  return ValueListenableBuilder<bool>(
    valueListenable: isObscuredNotifier,
    builder: (context, isObscuredValue, child) {
      return SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          obscureText: isObscuredValue,
          onChanged: onChanged,
          style: const TextStyle(color: AppColors.textColor1),
          decoration: InputDecoration(
            label: Text(label),
            labelStyle: const TextStyle(
              color: AppColors.textColor3,
            ),
            hintText: hint,
            hintStyle:
                const TextStyle(color: AppColors.textColor3, fontSize: 12),
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
            suffixIcon: IconButton(
              icon: Icon(
                isObscuredValue ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textColor3,
              ),
              onPressed: () {
                isObscuredNotifier.value = !isObscuredValue;
              },
            ),
          ),
          validator: validator,
        ),
      );
    },
  );
}
