import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/theme/image_sources.dart';

class MenuRepository {
  // I don’t know what the data from the api will look like, so for now this is hard coded

  static final testDrinks = [
    Drink(
      name: "Олеато",
      price: 139,
      image: ImageSources.oleato,
    ),
    Drink(
      name: "Олеато",
      price: 139,
      image: ImageSources.oleato,
    ),
    Drink(
      name: "Олеато",
      price: 139,
      image: ImageSources.oleato,
    ),
    Drink(
      name: "Олеато",
      price: 139,
      image: ImageSources.oleato,
    ),
  ];

  static final Map<Category, List<Drink>> menu = {
    Category(
      titleKey: GlobalKey(),
      categoryKey: GlobalKey(),
      name: "Черный кофе",
    ): testDrinks,
    Category(
      titleKey: GlobalKey(),
      categoryKey: GlobalKey(),
      name: "Кофе с молоком",
    ): testDrinks,
    Category(
      titleKey: GlobalKey(),
      categoryKey: GlobalKey(),
      name: "Чай",
    ): testDrinks,
    Category(
      titleKey: GlobalKey(),
      categoryKey: GlobalKey(),
      name: "Авторские напитки",
    ): testDrinks,
  };
}
