import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/BestSeller/view/widgets/custom_app_bar.dart';
import 'package:flower_app/features/Occasion/view/widgets/all_occasion.dart';
import 'package:flower_app/features/Occasion/view/widgets/list_all_occasion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Occasion',
              subTitle: 'Bloom with our exquisite best sellers',
            ),
            SizedBox(
              height: 65.h,
              width: double.infinity,
              child: AllOccasionList(),
            ),
            Expanded(
              child: OccasionListScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
