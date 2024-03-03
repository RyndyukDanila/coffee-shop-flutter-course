import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drink_card.dart';

class DrinksGrid extends StatelessWidget {
  const DrinksGrid({super.key, required this.drinks});

  final List<Drink> drinks;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return DrinkCard(drink: drinks[index]);
        },
        childCount: drinks.length,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 196,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
    );
  }
}
