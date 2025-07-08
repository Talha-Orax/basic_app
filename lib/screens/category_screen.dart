import 'package:basic_app/data/dummy_data.dart';
import 'package:basic_app/screens/meal_Screen.dart';
import 'package:basic_app/widgets/category_grid_items.dart';
import 'package:flutter/material.dart';

class CatergoryScreen extends StatelessWidget {
  const CatergoryScreen({super.key});

  void onselectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MealScreen(
          title: "some title",
          meals: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 209, 108, 30),
        title: const Text('Category Screen',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisExtent: 150,
            mainAxisSpacing:
                20), // Using SliverGridDelegateWithFixedCrossAxisCount to create a grid layout
        children: [
          // alternative to using a for loop
          // ...availableCategories.map((category) => CategoryGridItems(category: category)).toList
          // this will create a list of CategoryGridItems widgets from the availableCategories list and spread them into the children list of the GridView
          for (final category in availableCategories)
            CategoryGridItems(
              category: category,
              onSelectCategory: () => onselectCategory(context),
            ),
        ],
      ),
    );
  }
}
