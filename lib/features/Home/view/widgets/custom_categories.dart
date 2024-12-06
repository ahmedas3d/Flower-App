import 'dart:ui';

import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  final String imageAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64.h,
          width: 68.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.pinkLight,
          ),
          child: Center(
            child: Image.asset(
              imageAsset,
              width: 24.w,
              height: 23.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textColor1,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        )
      ],
    );
  }
}

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'assets/icons/tulip.png',
      'title': 'Flowers',
    },
    {
      'image': 'assets/icons/gift.png',
      'title': 'Gifts',
    },
    {
      'image': 'assets/icons/card.png',
      'title': 'Cards',
    },
    {
      'image': 'assets/icons/diamond.png',
      'title': 'Jewellery',
    },
    {
      'image': 'assets/icons/tulip.png',
      'title': 'Flowers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CustomCategories(
              imageAsset: items[index]['image']!,
              title: items[index]['title']!,
            ),
          );
        },
      ),
    );
  }
}
