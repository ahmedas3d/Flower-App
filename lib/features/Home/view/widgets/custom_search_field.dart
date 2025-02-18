import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

class customSearchField extends StatelessWidget {
  const customSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Inter',
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
