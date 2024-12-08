import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/Home/view/widgets/best_seller.dart';
import 'package:flower_app/features/Home/view/widgets/custom_categories.dart';
import 'package:flower_app/features/Home/view/widgets/custom_discover_card.dart';
import 'package:flower_app/features/Home/view/widgets/custom_search_field.dart';
import 'package:flower_app/features/Home/view/widgets/custom_titel.dart';
import 'package:flower_app/features/Home/view/widgets/occasion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 12.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/flower.png',
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Flowery',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: 'IM FELL English',
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: customSearchField(),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18.sp,
                    color: AppColors.greyColor,
                  ),
                  Text(
                    'Deliver to ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      color: AppColors.greyColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '2XVP+XC - Sheikh Zayed ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          color: AppColors.textColor1,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 24.sp,
                        color: AppColors.primaryColor,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              customTitle(
                title: 'Discover something now',
              ),
              SizedBox(
                height: 10.h,
              ),
              DiscoverList(),
              SizedBox(height: 8.h),
              customTitle(
                title: 'Categories',
                onTap: () {},
                viewAll: 'View All',
              ),
              SizedBox(
                height: 10.h,
              ),
              CategoriesList(),
              SizedBox(
                height: 10.h,
              ),
              customTitle(
                title: 'Best Sellers',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.bestSellerScreen);
                },
                viewAll: 'View All',
              ),
              SizedBox(
                height: 10.h,
              ),
              BestSellerList(),
              SizedBox(
                height: 10.h,
              ),
              customTitle(
                title: 'Occasion',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.occasionScreen);
                },
                viewAll: 'View All',
              ),
              SizedBox(
                height: 10.h,
              ),
              OccasionList(),
            ],
          ),
        ),
      ),
    );
  }
}
