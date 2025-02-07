import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class Specifications extends StatelessWidget {
  const Specifications({super.key, required this.product});
  final ProductModel product;

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
                product.price.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                S.of(context).status,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                S.of(context).inStock,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
          Text(
            S.of(context).allPricesIncludeTax,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.greyColor,
            ),
          ),
          Text(
            S.of(context).bouquet,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textColor1,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Text(
            S.of(context).description.substring(2, 10),
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textColor1,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            product.description,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: 15),
          Text(
            S.of(context).bouquetInclude,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textColor1,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            S.of(context).pinkRoses,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textColor1,
            ),
          ),
          Text(
            S.of(context).whiteWrap,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textColor1,
            ),
          ),
          SizedBox(height: 25),
          customButton(
            title: S.of(context).addToCart,
            onTap: () {},
            color: AppColors.primaryColor,
            textColor: AppColors.textColor2,
          ),
        ],
      ),
    );
  }
}
