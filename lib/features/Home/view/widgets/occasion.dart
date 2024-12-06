import 'dart:ui';

import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Occasion extends StatelessWidget {
  const Occasion({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  final String imageAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 151.h,
          width: 131.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textColor1,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class OccasionList extends StatelessWidget {
  OccasionList({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/occasion1.jpg',
      'title': 'Wedding',
    },
    {
      'image': 'assets/images/occasion.jpg',
      'title': 'Birthday',
    },
    {
      'image': 'assets/images/occasion2.jpg',
      'title': 'Graduation ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Occasion(
              imageAsset: items[index]['image']!,
              title: items[index]['title']!,
            ),
          );
        },
      ),
    );
  }
}
