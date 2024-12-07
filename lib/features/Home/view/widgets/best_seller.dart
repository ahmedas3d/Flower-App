import 'dart:ui';

import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.price,
  });

  final String imageAsset;
  final String title;
  final String price;

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
        SizedBox(height: 5.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textColor1,
            fontFamily: 'Inter',
          ),
        ),
        Text(
          '$price EGP',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textColor1,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}

class BestSellerList extends StatelessWidget {
  BestSellerList({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/best-seller1.jpg',
      'title': 'Sunny ',
      'price': '600',
    },
    {
      'image': 'assets/images/best-seller2.jpg',
      'title': 'Red roses',
      'price': '600',
    },
    {
      'image': 'assets/images/best-seller3.jpg',
      'title': 'Spring vase',
      'price': '600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: BestSellers(
              imageAsset: items[index]['image']!,
              title: items[index]['title']!,
              price: items[index]['price']!,
            ),
          );
        },
      ),
    );
  }
}
