import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';

class CartRepository {
  final Dio dio = Dio();

  Future<bool> postCart(Map<Drink, int> orderMap) async {
    final Map<String, int> order = {};

    for (var element in orderMap.entries) {
      final entrie = {element.key.id.toString(): element.value};
      order.addAll(entrie);
    }
    final request = {"positions": order, "token": "<FCM Registration Token>"};
    try {
      final response = await dio.post(
        'https://coffeeshop.academy.effective.band/api/v1/orders/',
        data: request,
      );
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
