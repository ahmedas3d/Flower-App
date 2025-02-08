import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:flower_app/features/Home/viewmodel/homecubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ProductDetails/view/screens/product_details_screen.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            height: 151,
            width: 131,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageCover),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            product.title.substring(0, 10),
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textColor1,
            ),
          ),
          Text(
            '${product.price} EGP',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textColor1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerList extends StatefulWidget {
  const BestSellerList({super.key});

  @override
  State<BestSellerList> createState() => _BestSellerListState();
}

class _BestSellerListState extends State<BestSellerList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return BestSellers(
                  product: state.products[index],
                );
              },
            ),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
