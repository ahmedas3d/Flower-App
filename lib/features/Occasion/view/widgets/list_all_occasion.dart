import 'dart:ui';

import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllOccasion extends StatelessWidget {
  const AllOccasion({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.price,
    required this.sale,
    required this.discount,
  });

  final String imageAsset;
  final String title;
  final String price;
  final String sale;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetails);
      },
      child: Container(
        height: 234.h,
        width: 170.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 135.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: AppColors.pinkLight,
                ),
                child: Center(
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 40.h,
                width: 125.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textColor1,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'EGP $price',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          discount,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.greyColor,
                            decorationThickness: 2.0,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          sale,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.greenColor,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 30.h,
                width: 150.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OccasionListScreen extends StatelessWidget {
  OccasionListScreen({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'price': '600',
      'sale': '20%',
      'discount': '800',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Sunny Vase',
      'price': '450',
      'sale': '15%',
      'discount': '530',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Spring Flowers',
      'price': '700',
      'sale': '10%',
      'discount': '780',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'price': '600',
      'sale': '20%',
      'discount': '800',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Sunny Vase',
      'price': '450',
      'sale': '15%',
      'discount': '530',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Spring Flowers',
      'price': '700',
      'sale': '10%',
      'discount': '780',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'price': '600',
      'sale': '20%',
      'discount': '800',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Sunny Vase',
      'price': '450',
      'sale': '15%',
      'discount': '530',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.7,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AllOccasion(
          imageAsset: items[index]['image']!,
          title: items[index]['title']!,
          price: items[index]['price']!,
          sale: items[index]['sale']!,
          discount: items[index]['discount']!,
        );
      },
    );
  }
}
