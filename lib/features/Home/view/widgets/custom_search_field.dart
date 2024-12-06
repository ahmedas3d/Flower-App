import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customSearchField extends StatelessWidget {
  const customSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'Inter',
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.h,
          horizontal: 8.w,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 20.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
