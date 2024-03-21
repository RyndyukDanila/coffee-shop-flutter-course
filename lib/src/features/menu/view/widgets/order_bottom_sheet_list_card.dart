import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';

class OrderBottomSheetListCard extends StatelessWidget {
  const OrderBottomSheetListCard({super.key, required this.drink});

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: drink.image,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.contain,
            width: 55,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            drink.name,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Expanded(child: Container()),
          Text(
            '${drink.price} ₽',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
