import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_list.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drinks_grid.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        cacheExtent: 3000,
        slivers: [
          SliverAppBar(
            pinned: true,
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: const CategoriesList(),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              var menuItem = MenuRepository.menu.entries.elementAt(index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            itemCount: MenuRepository.menu.length,
          ),
        ],
      ),
    );
  }

  Widget _buildDrinksGrid(List<Drink> drinks) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: DrinksGrid(
        drinks: drinks,
      ),
    );
  }

  Padding _buildCategoryTitle(
    GlobalKey key,
    String category,
    TextStyle style,
  ) {
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Text(
        category,
        style: style,
      ),
    );
  }
}
