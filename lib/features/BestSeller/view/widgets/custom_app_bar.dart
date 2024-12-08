import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 240.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
