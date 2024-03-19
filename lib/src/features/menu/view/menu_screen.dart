import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_header.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drinks_grid.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Category>? categoriesList;
  Map<Category, List<Drink>>? menu;

  int selectedCategoryIndex = 0;
  late final ScrollController scrollController;

  final int _categoryTitleHeight = 57;
  final int _drinksGridRowHeight = 196;
  final int _drinksGridGap = 16;

  @override
  void initState() {
    MenuRepository menuRepository = MenuRepository();
    menuRepository.getCategories().then(
      (value) {
        setState(() {
          categoriesList = value;
        });
      },
    );
    menuRepository.getMenu().then(
      (value) {
        setState(() {
          menu = value;
        });
      },
    ).then((value) {
      createBreakPoints(menu!);
    });

    scrollController = ScrollController();
    scrollController.addListener(updateCategoryIndexOnScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToCategory(int index) {
    scrollController.removeListener(updateCategoryIndexOnScroll);
    if (menu != null && selectedCategoryIndex != index) {
      setState(() {
        selectedCategoryIndex = index;
      });

      int totalItems = 0;

      for (var i = 0; i < index; i++) {
        final itemsInCategory = menu!.entries.elementAt(index).value.length;
        if (itemsInCategory.isEven) {
          totalItems += (itemsInCategory / 2).round();
        } else {
          totalItems += (itemsInCategory / 2).ceil();
        }
      }

      int categoryPosition = ((_categoryTitleHeight * index) + ((_drinksGridRowHeight + _drinksGridGap) * totalItems));
      scrollController.animateTo(
        categoryPosition.toDouble(),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    scrollController.addListener(updateCategoryIndexOnScroll);
  }

  List<double> breakPoints = [];
  void createBreakPoints(Map<Category, List<Drink>> menu) {
    final drinks = menu.values;

    int totalItems = 0;

    for (var i = 0; i < drinks.length; i++) {
      final itemsInCategory = menu.entries.elementAt(i).value.length;
      if (itemsInCategory.isEven) {
        totalItems += (itemsInCategory / 2).round();
      } else if (itemsInCategory.isOdd) {
        totalItems += (itemsInCategory / 2).ceil();
      }

      double categoryPosition = ((_categoryTitleHeight * i) + ((_drinksGridRowHeight + _drinksGridGap) * totalItems)).toDouble();

      breakPoints.add(categoryPosition);
    }
  }

  void updateCategoryIndexOnScroll() {
    double offset = scrollController.offset;
    if (menu != null) {
      final drinks = menu!.values;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          (categoriesList == null)
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 48, bottom: 0),
                    height: 100,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : SliverPersistentHeader(
                  delegate: CategoriesHeader(
                    categoriesList: categoriesList!,
                    onChanged: scrollToCategory,
                    selectedIndex: selectedCategoryIndex,
                  ),
                  pinned: true,
                ),
          (menu == null)
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 48, bottom: 0),
                    height: 100,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : SliverList.builder(
                  itemBuilder: (context, index) {
                    var menuItem = menu!.entries.elementAt(index);
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
                  itemCount: menu!.length,
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
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Text(
        category,
        style: style,
      ),
    );
  }
}
