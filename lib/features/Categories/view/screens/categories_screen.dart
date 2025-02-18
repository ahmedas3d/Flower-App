import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Categories/view/widgets/all_categories.dart';
import 'package:flower_app/features/Categories/view/widgets/filter_menu.dart';
import 'package:flower_app/features/Categories/view/widgets/list_all_categories.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

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
                  height: 50,
                  width: 285,
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: S.of(context).search,
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.7,
                          minChildSize: 0.3,
                          maxChildSize: 0.7,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: const FilterMenu(),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
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
