import "package:flutter/material.dart";

// Create a Category class that represents a category with an id, title, and color.

class Category {
  /// Constructor for Category class
  const Category(
      {required this.id, required this.title, this.color = Colors.orange});

  /// The unique identifier for the category.
  final String id;
  final String title;
  final Color color;
}
