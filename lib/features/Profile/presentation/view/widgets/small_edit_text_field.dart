import 'package:flutter/material.dart';

class SmallEditTextField extends StatelessWidget {
  const SmallEditTextField({
    super.key,
    required this.text,
    required this.label,
  });
  final String text;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
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
    );
  }
}
