import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class DeliveryTimeSection extends StatelessWidget {
  const DeliveryTimeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).deliveryTime,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Schedule',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Icon(
                Icons.watch_later_outlined,
                size: 18,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                'Instant,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Arrive by 03 Sep 2024, 11:00 AM ',
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
