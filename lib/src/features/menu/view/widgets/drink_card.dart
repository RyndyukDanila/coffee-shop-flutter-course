import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/src/features/menu/bloc/cart/cart_bloc.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrinkCard extends StatefulWidget {
  const DrinkCard({super.key, required this.drink});

  final Drink drink;

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
  @override
  void initState() {
    super.initState();
  }

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
          CachedNetworkImage(
            imageUrl: widget.drink.image,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final isInCart = state.orderMap[widget.drink];
              return isInCart != null ? _buildCartButtons(context) : _buildAddToCartButton(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<CartBloc>(context).add(IncrementDrinkInCart(drink: widget.drink));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
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
    );
  }

  Widget _buildCartButtons(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<CartBloc>(context).add(DecrementDrinkInCart(drink: widget.drink));
          },
          style: getDefaultElevatedButtonStyle(const Size(24, 24)),
          child: Icon(
            Icons.remove,
            size: Theme.of(context).iconTheme.size,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        ElevatedButton(
          onPressed: () {},
          style: getDefaultElevatedButtonStyle(const Size(52, 24)),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Text(
                "${state.orderMap[widget.drink]}",
                style: Theme.of(context).textTheme.titleSmall,
              );
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<CartBloc>(context).add(IncrementDrinkInCart(drink: widget.drink));
          },
          style: getDefaultElevatedButtonStyle(const Size(24, 24)),
          child: Icon(
            Icons.add,
            size: Theme.of(context).iconTheme.size,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
  }

  ButtonStyle getDefaultElevatedButtonStyle(Size size) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      minimumSize: const Size(0, 0),
      elevation: 0,
      fixedSize: size,
      backgroundColor: Theme.of(context).cardTheme.color,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
