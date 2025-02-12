import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Categories/view/widgets/filter_menu.dart';
import 'package:flower_app/features/Categories/view/widgets/list_all_categories.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllerCategories;

  @override
  void initState() {
    super.initState();
    _tabControllerCategories = TabController(length: 5, vsync: this);
  }

  void dispose() {
    _tabControllerCategories.dispose();
    super.dispose();
  }

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
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: FilterMenu(),
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
            TabBar(
              tabAlignment: TabAlignment.center,
              controller: _tabControllerCategories,
              isScrollable: true,
              indicatorWeight: 0.1,
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontFamily: "Almarai",
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(text: S.of(context).flowers),
                Tab(text: S.of(context).gifts),
                Tab(text: S.of(context).cards),
                Tab(text: S.of(context).jewellery),
                const Tab(text: "Jewellery"),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: producsts_with_categorie_id(
                  tabControllerCategories: _tabControllerCategories),
            ),
          ],
        ),
      ),
    );
  }
}

class producsts_with_categorie_id extends StatelessWidget {
  const producsts_with_categorie_id({
    super.key,
    required TabController tabControllerCategories,
  }) : _tabControllerCategories = tabControllerCategories;

  final TabController _tabControllerCategories;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabControllerCategories,
      children: [
        CategoriesList(),
        CategoriesList(),
        CategoriesList(),
        CategoriesList(),
        CategoriesList(),
      ],
    );
  }
}
