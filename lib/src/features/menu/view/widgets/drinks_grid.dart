import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drink_card.dart';

class DrinksGrid extends StatelessWidget {
  const DrinksGrid({super.key, required this.drinks});

  final List<Drink> drinks;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: drinks.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return DrinkCard(drink: drinks[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 196,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
    );
  }
}
