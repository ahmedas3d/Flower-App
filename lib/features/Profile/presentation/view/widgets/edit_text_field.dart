import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.text,
    required this.label,
  });
  final String text;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      controller: TextEditingController(text: text),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
