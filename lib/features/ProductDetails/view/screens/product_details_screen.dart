import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/ProductDetails/view/widgets/specifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 430.h,
                width: double.infinity,
                color: AppColors.pinkLight,
              ),
              SizedBox(
                height: 430.h,
                width: double.infinity,
                child: PageView(
                  controller: _pageController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(
                        'assets/images/product.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(
                        'assets/images/product.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(
                        'assets/images/product.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40.h,
                left: 20.w,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.textColor1,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      activeDotColor: AppColors.primaryColor,
                      dotColor: AppColors.greyColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Specifications(),
        ],
      ),
    );
  }
}
