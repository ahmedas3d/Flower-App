import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/Categories/viewmodel/products_cubit.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/product_trager/product_trager_cubit.dart';

class ListAllCategories extends StatefulWidget {
  ListAllCategories({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ListAllCategories> createState() => _ListAllCategoriesState();
}

class _ListAllCategoriesState extends State<ListAllCategories> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    bool isexite = context.read<ProductTragerCubit>().productTrager.contains(
          widget.product,
        );

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
                    widget.product.images[0],
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
                  widget.product.title,
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
                      'EGP ${widget.product.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'EGP ${widget.product.priceAfterDiscount}',
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
                      '${widget.product.discount}%',
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
            GestureDetector(
              onTap: () {
                if (isexite) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Product added to cart before'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  return;
                }

                context
                    .read<ProductTragerCubit>()
                    .productTrager
                    .add(widget.product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.greenColor,
                    content: Text('Product added to cart'),
                    duration: Duration(seconds: 1),
                  ),
                );
                setState(() {});
              },
              child: Container(
                height: height * 0.03,
                width: width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isexite ? AppColors.greyColor : AppColors.primaryColor,
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
                product: items[index],
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
