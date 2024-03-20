import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(orderMap: {})) {
    on<IncrementDrinkInCart>(
      (event, emit) {
        final count = state.orderMap[event.drink] ?? 0;
        state.orderMap[event.drink] = count + 1;
        emit(
          CartReady(
            orderMap: state.orderMap,
          ),
        );
      },
    );
    on<DecrementDrinkInCart>(
      (event, emit) {
        final count = state.orderMap[event.drink] ?? 0;
        if (count == 1) {
          state.orderMap.remove(event.drink);
        } else {
          state.orderMap[event.drink] = count - 1;
        }
        emit(
          CartReady(
            orderMap: state.orderMap,
          ),
        );
      },
    );
    on<DeleteCart>((event, emit) {
      emit(
        CartReady(
          orderMap: {},
        ),
      );
    });
  }
}
