import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/src/features/menu/bloc/cart/cart_bloc.dart';
import 'package:flutter_course/src/features/menu/bloc/menu/menu_bloc.dart';
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
  final MenuBloc _menuBloc = MenuBloc();

  int selectedCategoryIndex = 0;
  late final ScrollController scrollController;

  int? menuLength;
  final int _headerHeight = 50;
  final int _categoryTitleHeight = 57;
  final int _drinksGridRowHeight = 196;
  final int _drinksGridGap = 16;

  @override
  void initState() {
    _menuBloc.add(LoadMenu());

    scrollController = ScrollController();
    scrollController.addListener(updateCategoryIndexOnScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToCategory(int index) async {
    scrollController.removeListener(updateCategoryIndexOnScroll);
    if (selectedCategoryIndex != index) {
      setState(() {
        selectedCategoryIndex = index;
      });
      await scrollController.animateTo(
        index == 0 ? 0 : breakPoints[index - 1].toDouble(),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    scrollController.addListener(updateCategoryIndexOnScroll);
  }

  List<double> breakPoints = [];
  void createBreakPoints(Map<Category, List<Drink>> menu) {
    menuLength = menu.entries.length;
    int totalItems = 0;

    for (var i = 0; i < menuLength!; i++) {
      final itemsInCategory = menu.entries.elementAt(i).value.length;
      if (itemsInCategory.isEven) {
        totalItems += (itemsInCategory / 2).round();
      } else {
        totalItems += (itemsInCategory / 2).ceil();
      }

      double categoryPosition = _headerHeight + ((_categoryTitleHeight * i) + ((_drinksGridRowHeight + _drinksGridGap) * totalItems)).toDouble();

      breakPoints.add(categoryPosition);
    }
  }

  void updateCategoryIndexOnScroll() {
    double offset = scrollController.offset;
    if (menuLength != null) {
      for (var i = 0; i < menuLength!; i++) {
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
      body: BlocBuilder<MenuBloc, MenuState>(
        bloc: _menuBloc,
        builder: (context, state) {
          if (state is MenuReady) {
            createBreakPoints(state.menu);
            return BlocProvider(
              create: (context) => CartBloc(),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverPersistentHeader(
                    delegate: CategoriesHeader(
                      categoriesList: state.categoriesList,
                      onChanged: scrollToCategory,
                      selectedIndex: selectedCategoryIndex,
                    ),
                    pinned: true,
                  ),
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      var menuItem = state.menu.entries.elementAt(index);
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
                    itemCount: state.menu.length,
                  ),
                ],
              ),
            );
          } else if (state is MenuError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Что-то пошло не так :(',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () => _menuBloc.add(LoadMenu()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(0, 0),
                      elevation: 0,
                      fixedSize: const Size.fromHeight(40),
                      backgroundColor: Theme.of(context).cardTheme.color,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Перезагрузить',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
