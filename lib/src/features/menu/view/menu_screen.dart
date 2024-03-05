import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_list.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drinks_grid.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: const CategoriesList(),
          ),
          ...MenuRepository.menu.entries.map(
            (menuItem) {
              return SliverMainAxisGroup(
                slivers: [
                  _buildCategoryTitle(
                    menuItem.key.key,
                    menuItem.key.name,
                    Theme.of(context).textTheme.titleLarge!,
                  ),
                  _buildDrinksGrid(
                    menuItem.value,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  SliverPadding _buildDrinksGrid(List<Drink> drinks) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      sliver: DrinksGrid(
        drinks: drinks,
      ),
    );
  }

  SliverPadding _buildCategoryTitle(
    GlobalKey key,
    String category,
    TextStyle style,
  ) {
    return SliverPadding(
      key: key,
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          category,
          style: style,
        ),
      ),
    );
  }
}
