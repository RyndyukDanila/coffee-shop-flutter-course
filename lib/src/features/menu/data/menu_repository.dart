import 'package:dio/dio.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';

class MenuRepository {
  final Dio dio = Dio();

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
