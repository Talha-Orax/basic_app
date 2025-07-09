import 'package:basic_app/model/meal.dart';
import 'package:basic_app/screens/category_screen.dart';
import 'package:basic_app/screens/filter_screen.dart';
import 'package:basic_app/screens/meal_screen.dart';
import 'package:basic_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // List to store favorite meals
  final List<Meal> favoriteMeals = [];

  ///this function will add and remove meals from the favoriteMeals list
  ///if the meal already exists in the list, it will be removed, otherwise it will add
  void ontoogleFavoriteMeal(Meal meal) {
    final mealexists = favoriteMeals.contains(meal);
    if (mealexists) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      favoriteInfoUpdate("${meal.title} removed from favorites");
    } else {
      setState(() {
        favoriteMeals.add(meal);
        favoriteInfoUpdate("${meal.title} added to favorites");
      });
    }
  }

  void favoriteInfoUpdate(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  int selectedIndex = 0;
  void selectScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void selectScreenByDrawer(String identifier) {
    Navigator.pop(context); // Close the drawer
    if (identifier == "Settings") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Filters(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen =
        CatergoryScreen(ontoogleFavoriteMeal: ontoogleFavoriteMeal);
    var activePageTitle = "Category Screen";
    if (selectedIndex == 1) {
      activeScreen = MealScreen(
          meals: favoriteMeals, ontoogleFavoriteMeal: ontoogleFavoriteMeal);
      activePageTitle = "Your Favorites";
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 209, 108, 30),
          title: Text(activePageTitle,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ),
        drawer: MainDrawer(
          onSelectScreen: selectScreenByDrawer,
        ),
        body: activeScreen, //

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          onTap: selectScreen,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal_rounded), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
          ],
        ) //
        );
  }
}
