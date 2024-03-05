import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/view/widgets/category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
      itemCount: MenuRepository.menu.entries.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          category: MenuRepository.menu.entries.elementAt(index).key,
          index: index,
          selectedIndex: selectedIndex,
          setSelectedIndex: setSelectedIndex,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 8,
        );
      },
    );
  }
}
