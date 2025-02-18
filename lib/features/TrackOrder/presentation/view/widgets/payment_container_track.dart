import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

class PaymentContainerTrack extends StatelessWidget {
  const PaymentContainerTrack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300] ?? Colors.grey,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.paid,
                  color: AppColors.textColor3,
                  size: 23,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'EGY 3000',
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Pay with cash',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
