import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrinkCard extends StatefulWidget {
  const DrinkCard({super.key, required this.drink});

  final Drink drink;

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardTheme.surfaceTintColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: widget.drink.image,
            fit: BoxFit.contain,
            height: 100,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.drink.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 0),
              elevation: 0,
              fixedSize: const Size(116, 24),
              backgroundColor: Theme.of(context).cardTheme.color,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              "${widget.drink.price} ${AppLocalizations.of(context)!.currency}",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
