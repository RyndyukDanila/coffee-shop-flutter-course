import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';
import 'package:flutter_course/src/theme/image_sources.dart';

class MenuRepository {
  final Dio dio = Dio();

  static const testDrinks = [
    Drink(
      id: 0,
      name: "Олеато",
      category: Category(id: 0, name: 'name'),
      price: 139,
      image: ImageSources.oleato,
    ),
    Drink(
      id: 0,
      name: "Олеато",
      category: Category(id: 0, name: 'name'),
      price: 139,
      image: ImageSources.oleato,
    ),
    Drink(
      id: 0,
      name: "Олеато",
      category: Category(id: 0, name: 'name'),
      price: 139,
      image: ImageSources.oleato,
    ),
    Drink(
      id: 0,
      name: "Олеато",
      category: Category(id: 0, name: 'name'),
      price: 139,
      image: ImageSources.oleato,
    ),
  ];

  // static const Map<Category, List<Drink>> menu = {
  //   Category(
  //     id: 0,
  //     name: "Черный кофе",
  //   ): testDrinks,
  //   Category(
  //     id: 1,
  //     name: "Кофе с молоком",
  //   ): testDrinks,
  //   Category(
  //     id: 2,
  //     name: "Чай",
  //   ): testDrinks,
  //   Category(
  //     id: 3,
  //     name: "Авторские напитки",
  //   ): testDrinks,
  // };

  Future<List<Category>> getCategories() async {
    final response = await dio.get(
      'https://coffeeshop.academy.effective.band/api/v1/products/categories',
    );

    final data = response.data['data'] as List<dynamic>;
    final categoriesList = data.map((e) {
      return Category.fromJson(e as Map<String, dynamic>);
    }).toList();

    return categoriesList;
  }

  Future<List<Drink>> getDrinksByCategory(Category category) async {
    final response = await dio.get(
      'https://coffeeshop.academy.effective.band/api/v1/products/?category=${category.id}',
    );

    final data = response.data['data'] as List<dynamic>;
    final drinksByCategoryList = data.map((e) {
      return Drink.fromJson(e as Map<String, dynamic>);
    }).toList();

    return drinksByCategoryList;
  }

  Future<Map<Category, List<Drink>>> getMenu() async {
    final categoriesList = await getCategories();
    final Map<Category, List<Drink>> menu = {};
    for (var category in categoriesList) {
      final drinks = await getDrinksByCategory(category);
      menu.addEntries({category: drinks}.entries);
    }
    return menu;
  }
}
