import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String name;
  late int index;
  late int selectedIndex;
  Function setSelectedIndex;
  bool get isSelected => selectedIndex == index;

  CategoryItem({
    super.key,
    required this.name,
    required this.index,
    required this.selectedIndex,
    required this.setSelectedIndex,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: widget.isSelected,
      onSelected: (value) {
        widget.setSelectedIndex(widget.index);
        // TODO scroll to category
      },
      labelStyle: widget.isSelected
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.labelSmall,
      label: Container(
        alignment: Alignment.center,
        height: 36,
        child: Text(
          widget.name,
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
