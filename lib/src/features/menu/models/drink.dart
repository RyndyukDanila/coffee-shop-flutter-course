import 'package:flutter/material.dart';
import 'package:flutter_course/src/theme/image_sources.dart';

// TODO
final List<Drink> blackCoffeeDrinks = [];
final List<Drink> milkCoffeeDrinks = [];
final List<Drink> teaDrinks = [];
final List<Drink> signatureDrinks = [];

final List<Drink> allDrinks = [
  Drink(name: "Олеато", price: 139, image: ImageSources.oleato),
  Drink(name: "Айс Латте", price: 99, image: ImageSources.iceLatte),
];

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
