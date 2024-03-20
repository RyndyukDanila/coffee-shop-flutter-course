part of 'cart_bloc.dart';

class CartEvent {}

class IncrementDrinkInCart extends CartEvent {
  IncrementDrinkInCart({
    required this.drink,
  });

  final Drink drink;
}

class DecrementDrinkInCart extends CartEvent {
  DecrementDrinkInCart({
    required this.drink,
  });

  final Drink drink;
}

class DeleteCart extends CartEvent {}
