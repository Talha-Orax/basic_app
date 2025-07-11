import 'package:basic_app/model/meal.dart';
import 'package:basic_app/screens/meal_discription.dart';
import 'package:basic_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of meals with a title in the app bar.
class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;
  void selectmeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MealDiscriptionScreen(
                meal: meal,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// the content is a custom ListView that displays the meals.its used in body of Scaffold.
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => Mealitem(
              meal: meals[index],
              onSelectMeal: (meal) => selectmeal(context, meal),
            ));

    if (meals.isEmpty) {
      ///if the meals list is empty, it displays a message indicating that no meals were found.
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("No meals found",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(height: 16),
            Text("Try selecting a different category",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title!,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: content);
  }
}
