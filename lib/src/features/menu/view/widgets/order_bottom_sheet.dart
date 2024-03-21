import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/src/features/menu/bloc/cart/cart_bloc.dart';
import 'package:flutter_course/src/features/menu/view/widgets/order_bottom_sheet_list.dart';

class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.surfaceTintColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).cardTheme.surfaceTintColor,
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              Container(
                width: Theme.of(context).bottomSheetTheme.dragHandleSize?.width,
                height: Theme.of(context).bottomSheetTheme.dragHandleSize?.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomSheetTheme.dragHandleColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Ваш заказ',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(DeleteCart());
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.delete_outline),
                    color: Theme.of(context).bottomSheetTheme.dragHandleColor,
                    iconSize: 24,
                  ),
                ],
              ),
              Container(
                width: double.maxFinite,
                height: 1,
                color: Theme.of(context).bottomSheetTheme.dragHandleColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return OrderBottomSheetList(
                      orderMap: state.orderMap,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocListener<CartBloc, CartState>(
                listener: (context, state) {
                  if (state is CartSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: _buildSnackBarContainer(
                          context,
                          'Заказ создан',
                        ),
                      ),
                    );
                    BlocProvider.of<CartBloc>(context).add(DeleteCart());
                    Navigator.of(context).pop();
                  } else if (state is CartFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: _buildSnackBarContainer(
                          context,
                          'Возникла ошибка при заказе',
                        ),
                      ),
                    );
                    BlocProvider.of<CartBloc>(context).add(ReloadCart());
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(PostCart());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.maxFinite, 56),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Оформить заказ',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSnackBarContainer(
    BuildContext context,
    String text,
  ) {
    return Container(
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      height: 72,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
