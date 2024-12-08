import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Specifications extends StatelessWidget {
  const Specifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'EGP 1,500',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
              const Spacer(),
              Text(
                'Status:',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                'In Stock',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          Text(
            'All prices include tax:',
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.greyColor,
              fontFamily: 'Inter',
            ),
          ),
          Text(
            '15 Pink Rose Bouquet',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textColor1,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'Description:',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textColor1,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, in semper ante commodo. Etiam in lectus vitae libero convallis vestibulum. ',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'Bouquet include',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textColor1,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          Text(
            'Pink roses:15',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textColor1,
              fontFamily: 'Inter',
            ),
          ),
          Text(
            'White wrap',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textColor1,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 25.h),
          customButton(
            title: 'Add to Cart',
            onTap: () {},
            color: AppColors.primaryColor,
            textColor: AppColors.textColor2,
          ),
        ],
      ),
    );
  }
}
