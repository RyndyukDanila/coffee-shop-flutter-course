import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/view/widgets/category_item.dart';

class CategoriesList extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  const CategoriesList({
    super.key,
    required this.onChanged,
    required this.selectedIndex,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CategoriesList oldWidget) {
    scrollController.animateTo(
      (50 * widget.selectedIndex).toDouble(), // TODO percise scroll position
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
      itemCount: MenuRepository.menu.entries.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          category: MenuRepository.menu.entries.elementAt(index).key,
          index: index,
          selectedIndex: widget.selectedIndex,
          onChanged: widget.onChanged,
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
