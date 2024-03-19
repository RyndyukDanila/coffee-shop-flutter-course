import 'package:flutter_course/src/features/menu/models/category.dart';

class Drink {
  final int id;
  final String name;
  final Category category;
  final double price;
  final String image;

  const Drink({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
  });

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        id: json['id'] as int,
        name: json['name'] as String,
        category: (Category.fromJson(json['category'] as Map<String, dynamic>)),
        price: double.parse(((json['prices'] as List<dynamic>).first as Map<String, dynamic>)['value'].toString()),
        image: json['imageUrl'] as String,
      );
}
