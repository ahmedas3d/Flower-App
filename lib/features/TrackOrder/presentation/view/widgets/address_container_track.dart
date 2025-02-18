import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressContainerTrack extends StatelessWidget {
  const AddressContainerTrack({
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
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.textColor3,
                  size: 23,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  S.of(context).home,
                  style: const TextStyle(
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
              '2XVP+XC - Sheikh Zayed',
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
