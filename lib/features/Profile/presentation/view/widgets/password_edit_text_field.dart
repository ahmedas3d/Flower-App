import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PasswordEditTextField extends StatelessWidget {
  const PasswordEditTextField({
    super.key,
    required this.text,
    required this.label,
    required this.onChangePressed,
  });

  final String text;
  final String label;
  final VoidCallback onChangePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: true,
            controller: TextEditingController(text: text),
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onChangePressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              S.of(context).change,
              style: const TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
