part of 'cart_bloc.dart';

class CartState {
  CartState({
    required this.orderMap,
  });

  final Map<Drink, int> orderMap;
}

class CartInitial extends CartState {
  CartInitial({required super.orderMap});
}

class CartReady extends CartState {
  CartReady({
    required super.orderMap,
    required this.cartPrice,
  });

  final int cartPrice;
}

class CartSuccess extends CartState {
  CartSuccess({
    required super.orderMap,
  });
}

class CartFailure extends CartState {
  CartFailure({
    required super.orderMap,
  });
}
