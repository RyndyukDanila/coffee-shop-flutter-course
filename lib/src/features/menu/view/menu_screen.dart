import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_list.dart';

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
        ],
      ),
    );
  }
}
