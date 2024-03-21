import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/order_bottom_sheet_list_card.dart';

class OrderBottomSheetList extends StatelessWidget {
  const OrderBottomSheetList({super.key, required this.orderMap});

  final Map<Drink, int> orderMap;

  @override
  Widget build(BuildContext context) {
    final List<Drink> orderList = [];
    for (var element in orderMap.entries) {
      for (var i = 0; i < element.value; i++) {
        orderList.add(element.key);
      }
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderBottomSheetListCard(drink: orderList[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: orderList.length,
    );
  }
}
