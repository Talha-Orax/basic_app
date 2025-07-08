import "package:basic_app/main.dart";
import "package:basic_app/model/category.dart";
import "package:flutter/material.dart";

class CategoryGridItems extends StatelessWidget {
  /// A widget that displays a grid item for a category.
  /// It shows the category title with a gradient background based on the category's color.
  // // Requires a Category object to be passed in.
  /// /// The category parameter must not be null.
  const CategoryGridItems({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.primary,
      onTap: () {
        // Handle tap event, e.g., navigate to a category detail screen
      },
      child: Container(
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,

          /// Use the titleLarge style from the current theme's text theme and set the color to the onSurface color from the current theme's color scheme.
          /// This ensures that the text is styled consistently with the app's theme.
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
