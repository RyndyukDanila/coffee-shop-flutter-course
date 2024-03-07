import 'package:flutter/material.dart';

class Category {
  final GlobalKey titleKey;
  final GlobalKey categoryKey;
  final String name;

  Category({
    required this.titleKey,
    required this.categoryKey,
    required this.name,
  });
}
