import 'package:flutter/material.dart';

final List<Category> categoriesList = [
  Category(GlobalKey(), "Черный кофе"),
  Category(GlobalKey(), "Кофе с молоком"),
  Category(GlobalKey(), "Чай"),
  Category(GlobalKey(), "Авторские напитки"),
];

class Category {
  final GlobalKey key;
  final String name;

  const Category(this.key, this.name);
}
