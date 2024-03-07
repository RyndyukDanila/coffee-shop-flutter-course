import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  bool get isSelected => selectedIndex == index;

  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      key: widget.category.categoryKey,
      selected: widget.isSelected,
      onSelected: (value) {
        widget.onChanged(widget.index);
        // final targetContext = widget.category.titleKey.currentContext;
        // if (targetContext != null) {
        //   Scrollable.ensureVisible(
        //     targetContext,
        //     duration: const Duration(milliseconds: 400),
        //     curve: Curves.easeInOut,
        //   );
        // }
      },
      labelStyle: widget.isSelected
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.labelSmall,
      label: Container(
        alignment: Alignment.center,
        height: 36,
        child: Text(
          widget.category.name,
          textAlign: TextAlign.center,
        ),
      ),
      padding: EdgeInsets.zero,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      selectedColor: Theme.of(context).cardTheme.color,
      disabledColor: Theme.of(context).cardTheme.surfaceTintColor,
      showCheckmark: false,
    );
  }
}
