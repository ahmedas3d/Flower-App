import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: TextField(
          decoration: InputDecoration(
            hintText: S.of(context).search,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
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
        ),
      ),
    );
  }
}
