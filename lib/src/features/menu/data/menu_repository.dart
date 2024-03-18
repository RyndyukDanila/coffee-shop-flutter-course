import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/theme/image_sources.dart';

class MenuRepository {
  // I don’t know what the data from the api will look like, so for now this is hard coded

  static const testDrinks = [
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

  static const Map<Category, List<Drink>> menu = {
    Category(
      id: 0,
      name: "Черный кофе",
    ): testDrinks,
    Category(
      id: 1,
      name: "Кофе с молоком",
    ): testDrinks,
    Category(
      id: 2,
      name: "Чай",
    ): testDrinks,
    Category(
      id: 3,
      name: "Авторские напитки",
    ): testDrinks,
  };
}
