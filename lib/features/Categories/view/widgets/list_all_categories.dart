import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/Categories/viewmodel/products_cubit.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListAllCategories extends StatelessWidget {
  const ListAllCategories({
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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      height: height * 0.95,
      width: width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.productDetails),
              child: Container(
                height: height * 0.18,
                width: width * 0.35,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                ),
                child: Center(
                  child: Image.network(
                    imageAsset,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textColor1,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      'EGP $price',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      discount,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.greyColor,
                        decorationThickness: 2.0,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      sale,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
              height: height * 0.03,
              width: width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    S.of(context).addToCart,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsError) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (state is ProductsLoaded) {
          final items = state.products;
          if (context.read<ProductsCubit>().selectedCategory != 'All') {
            items.removeWhere((element) =>
                element.category !=
                context.read<ProductsCubit>().selectedCategory);
          }
          return GridView.builder(
            padding: const EdgeInsets.only(bottom: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListAllCategories(
                imageAsset: items[index].images[0]!,
                title: items[index].title,
                price: items[index].price.toString(),
                sale: items[index].priceAfterDiscount.toString(),
                discount: items[index].discount.toString(),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
