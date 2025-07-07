import "package:basic_app/model/Category.dart";
import "package:flutter/material.dart";

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.99),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 50,
          mainAxisExtent: 50,
        ),
      ),
    );
  }
}
