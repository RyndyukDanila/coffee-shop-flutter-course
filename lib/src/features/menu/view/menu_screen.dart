import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_list.dart';
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
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.black_coffee,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.milk_coffee,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.tea,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.signature_drinks,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
