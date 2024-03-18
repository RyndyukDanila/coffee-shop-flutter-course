import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_header.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drinks_grid.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final ScrollController scrollController;
  int selectedCategoryIndex = 0;

  final int _categoryTitleHeight = 57;
  final int _drinksGridRowHeight = 196;
  final int _drinksGridGap = 16;

  @override
  void initState() {
    createBreakPoints();
    scrollController = ScrollController();
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToCategory(int index) {
    scrollController.removeListener(() {
      updateCategoryIndexOnScroll;
    });
    if (selectedCategoryIndex != index) {
      setState(() {
        selectedCategoryIndex = index;
      });

      int totalItems = 0;

      for (var i = 0; i < index; i++) {
        final itemsInCategory =
            MenuRepository.menu.entries.elementAt(index).value.length;
        if (itemsInCategory.isEven) {
          totalItems += (itemsInCategory / 2).round();
        } else {
          totalItems += (itemsInCategory / 2).ceil();
        }
      }

      int categoryPosition = ((_categoryTitleHeight * index) +
          ((_drinksGridRowHeight + _drinksGridGap) * totalItems));
      scrollController.animateTo(
        categoryPosition.toDouble(),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
  }

  List<double> breakPoints = [];
  void createBreakPoints() {
    final drinks = MenuRepository.menu.values;

    int totalItems = 0;

    for (var i = 0; i < drinks.length; i++) {
      final itemsInCategory =
          MenuRepository.menu.entries.elementAt(i).value.length;
      if (itemsInCategory.isEven) {
        totalItems += (itemsInCategory / 2).round();
      } else if (itemsInCategory.isOdd) {
        totalItems += (itemsInCategory / 2).ceil();
      }

      double categoryPosition = ((_categoryTitleHeight * i) +
              ((_drinksGridRowHeight + _drinksGridGap) * totalItems))
          .toDouble();

      breakPoints.add(categoryPosition);
    }
  }

  void updateCategoryIndexOnScroll(double offset) {
    final drinks = MenuRepository.menu.values;
    for (var i = 0; i < drinks.length; i++) {
      if (i == 0) {
        if ((offset < breakPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      } else if ((offset >= breakPoints[i - 1]) & (offset < breakPoints[i])) {
        if (selectedCategoryIndex != i) {
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(
            delegate: CategoriesHeader(
              menu: MenuRepository.menu,
              onChanged: scrollToCategory,
              selectedIndex: selectedCategoryIndex,
            ),
            pinned: true,
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              var menuItem = MenuRepository.menu.entries.elementAt(index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryTitle(
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

  Widget _buildCategoryTitle(
    String category,
    TextStyle style,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Text(
        category,
        style: style,
      ),
    );
  }
}
