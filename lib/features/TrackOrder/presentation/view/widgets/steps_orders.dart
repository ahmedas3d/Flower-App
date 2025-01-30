import 'package:flutter/material.dart';

class StepsOrders extends StatelessWidget {
  final List<bool> isGreenList;

  const StepsOrders({super.key, required this.isGreenList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: isGreenList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final color = isGreenList[index] ? Colors.green : Colors.grey[400];

          return Container(
            width: 80,
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
