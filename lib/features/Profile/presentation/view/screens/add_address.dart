import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).address),
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
      ),
    );
  }
}
