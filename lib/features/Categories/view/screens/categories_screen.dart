import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Categories/view/widgets/all_categories.dart';
import 'package:flower_app/features/Categories/view/widgets/list_all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 12, left: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 285.w,
                  child: Center(
                    child: TextField(
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
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 65.h,
              width: double.infinity,
              child: AllCategories(),
            ),
            Expanded(
              child: CategoriesList(),
            ),
          ],
        ),
      ),
    );
  }
}
