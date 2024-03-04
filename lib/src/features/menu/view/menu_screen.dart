import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_list.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drinks_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          _buildCategoryTitle(
            categoriesList[0].key,
            AppLocalizations.of(context)!.black_coffee,
            Theme.of(context).textTheme.titleLarge!,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            sliver: DrinksGrid(drinks: allDrinks),
          ),
          _buildCategoryTitle(
            categoriesList[1].key,
            AppLocalizations.of(context)!.milk_coffee,
            Theme.of(context).textTheme.titleLarge!,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            sliver: DrinksGrid(drinks: allDrinks),
          ),
          _buildCategoryTitle(
            categoriesList[2].key,
            AppLocalizations.of(context)!.tea,
            Theme.of(context).textTheme.titleLarge!,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            sliver: DrinksGrid(drinks: allDrinks),
          ),
          _buildCategoryTitle(
            categoriesList[3].key,
            AppLocalizations.of(context)!.signature_drinks,
            Theme.of(context).textTheme.titleLarge!,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            sliver: DrinksGrid(drinks: allDrinks),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle(GlobalKey key, String category, TextStyle style) {
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
