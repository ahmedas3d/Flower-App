import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/utils/product_trager/product_trager_cubit.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utils/product_trager/product_trager_state.dart';

class Specifications extends StatelessWidget {
  const Specifications({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  product.price.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  S.of(context).status,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  S.of(context).inStock,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
            Text(
              S.of(context).allPricesIncludeTax,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.greyColor,
              ),
            ),
            Text(
              S.of(context).bouquet,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textColor1,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).description.substring(2, 10),
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textColor1,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).bouquetInclude,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textColor1,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              S.of(context).pinkRoses,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textColor1,
              ),
            ),
            Text(
              S.of(context).whiteWrap,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textColor1,
              ),
            ),
            const SizedBox(height: 25),
            BlocConsumer<ProductTragerCubit, ProductTragerState>(
              listener: (context, state) {
                if (state is ProductTragerError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                } else if (state is ProductTragerSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: const Text("add to cart successfully"),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is ProductTragerLoading,
                  child: customButton(
                    title: S.of(context).addToCart,
                    onTap: () {
                      context
                          .read<ProductTragerCubit>()
                          .addProductToCart(product);
                    },
                    color: AppColors.primaryColor,
                    textColor: AppColors.textColor2,
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
