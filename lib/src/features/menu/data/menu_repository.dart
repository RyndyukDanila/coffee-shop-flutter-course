import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/theme/image_sources.dart';

class MenuRepository {
  // I don’t know what the data from the api will look like, so for now this is hard coded

  static final Map<Category, List<Drink>> menu = {
    Category(
      key: GlobalKey(),
      name: "Черный кофе",
    ): [
      Drink(
        name: "Олеато",
        price: 139,
        image: ImageSources.oleato,
      ),
      Drink(
        name: "Айс Латте",
        price: 99,
        image: ImageSources.iceLatte,
      ),
    ],
    Category(
      key: GlobalKey(),
      name: "Кофе с молоком",
    ): [
      Drink(
        name: "Олеато",
        price: 139,
        image: ImageSources.oleato,
      ),
      Drink(
        name: "Айс Латте",
        price: 99,
        image: ImageSources.iceLatte,
      ),
    ],
    Category(
      key: GlobalKey(),
      name: "Чай",
    ): [
      Drink(
        name: "Олеато",
        price: 139,
        image: ImageSources.oleato,
      ),
      Drink(
        name: "Айс Латте",
        price: 99,
        image: ImageSources.iceLatte,
      ),
    ],
    Category(
      key: GlobalKey(),
      name: "Авторские напитки",
    ): [
      Drink(
        name: "Олеато",
        price: 139,
        image: ImageSources.oleato,
      ),
      Drink(
        name: "Айс Латте",
        price: 99,
        image: ImageSources.iceLatte,
      ),
    ],
  };
}
