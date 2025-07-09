import 'package:basic_app/model/meal.dart';
import 'package:flutter/material.dart';

class MealDiscriptionScreen extends StatelessWidget {
  const MealDiscriptionScreen(
      {super.key, required this.meal, required this.onToogleFavoriteMeal});
  final Meal meal;
  final void Function(Meal meal) onToogleFavoriteMeal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              onToogleFavoriteMeal(meal);
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(meal.imageUrl, fit: BoxFit.cover),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Ingredients',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 2),
            textAlign: TextAlign.center,
          ),
          for (final ingredient in meal.ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Center(
                child: Text(
                  ingredient,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Steps',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 2),
            textAlign: TextAlign.center,
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                '> $step',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
