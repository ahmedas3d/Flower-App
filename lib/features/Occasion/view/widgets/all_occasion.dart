import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllOccasionList extends StatefulWidget {
  const AllOccasionList({super.key});

  @override
  _AllOccasionState createState() => _AllOccasionState();
}

class _AllOccasionState extends State<AllOccasionList> {
  int selectedIndex = 0;

  final List<String> categories = [
    'Wedding',
    'Graduation',
    'Birthday',
    'Katb Ketab',
    'Engagement',
    'Thank you',
    'Get well'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isActive = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: isActive ? AppColors.primaryColor : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 40,
                  color: isActive ? AppColors.primaryColor : Colors.grey[300],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
