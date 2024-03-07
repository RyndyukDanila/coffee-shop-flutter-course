import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/view/widgets/categories_list.dart';

class CategoriesHeader extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  CategoriesHeader({required this.onChanged, required this.selectedIndex});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      height: 100,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CategoriesList(
        onChanged: onChanged,
        selectedIndex: selectedIndex,
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
