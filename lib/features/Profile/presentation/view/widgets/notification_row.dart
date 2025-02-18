import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatefulWidget {
  NotificationRow({super.key});

  @override
  State<NotificationRow> createState() => _NotificationRowState();
}

class _NotificationRowState extends State<NotificationRow> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          alignment: Alignment.centerLeft,
          scale: 0.75,
          child: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeColor: AppColors.primaryColor,
            activeTrackColor: Colors.pink[200],
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[300],
          ),
        ),
        Text(
          S.of(context).notifications,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.greyColor,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: AppColors.greyColor,
        ),
      ],
    );
  }
}
