// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

enum PlaceCategory {
  food,
  health,
  finance,
  others,
}

// Convert to enum
PlaceCategory getCategoryFromString(String value) => PlaceCategory.values
    .firstWhere((e) => e.name.toLowerCase() == value.toLowerCase());

List<PlaceCategoryData> placeCategoryData = [
  PlaceCategoryData(
    name: 'Food',
    icon: Icons.food_bank,
    category: PlaceCategory.food,
  ),
  PlaceCategoryData(
    name: 'Health',
    icon: Icons.medical_services_rounded,
    category: PlaceCategory.health,
  ),
  PlaceCategoryData(
    name: 'Finance',
    icon: Icons.monetization_on,
    category: PlaceCategory.finance,
  ),
  PlaceCategoryData(
    name: 'Others',
    icon: Icons.category,
    category: PlaceCategory.others,
  ),
];

class PlaceCategoryData {
  final String name;
  final IconData icon;
  final PlaceCategory category;
  PlaceCategoryData({
    required this.name,
    required this.icon,
    required this.category,
  });
}
