import 'package:basic_app/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:basic_app/provider/favorite_provider.dart';

class MealDiscriptionScreen extends ConsumerWidget {
  const MealDiscriptionScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final wasadded = ref
                  .read(favoriteProvider.notifier)
                  .onToogleFavoriteMeal(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(wasadded
                    ? " ${meal.title} removed as favorite"
                    : "${meal.title} added as favorite"),
                duration: const Duration(seconds: 1),
              ));
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
