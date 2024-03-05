import 'package:flutter/material.dart';

class Drink {
  final String name;
  final int price;
  final ImageProvider<Object> image;

  Drink({
    required this.name,
    required this.price,
    required this.image,
  });
}
