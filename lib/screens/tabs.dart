import 'package:basic_app/data/dummy_data.dart';
import 'package:basic_app/screens/category_screen.dart';
import 'package:basic_app/screens/filter_screen.dart';
import 'package:basic_app/screens/meal_screen.dart';
import 'package:basic_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:basic_app/provider/favorite_provider.dart';

/// Enum to define the filter options
const kinitializedFilters = {
  FilterEnum.glutenFree: false,
  FilterEnum.lactoseFree: false,
  FilterEnum.vegan: false,
  FilterEnum.vegetarian: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  /// This is a map to store the selected filters with default values
  Map<FilterEnum, bool> _selectedFilters = kinitializedFilters;

  int selectedIndex = 0;
  void selectScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void selectScreenByDrawer(String identifier) async {
    Navigator.pop(context); // Close the drawer
    if (identifier == "Settings") {
      /// Navigate to the filter screen and wait for the result the result will store in reults and we had further defined the push event to return the filter values
      final results = await Navigator.of(context).push<Map<FilterEnum, bool>>(
        MaterialPageRoute(
          builder: (context) => Filters(checkfilters: _selectedFilters),
        ),
      );
      setState(() {
        /// If the results are null, we will use the initialized filters which are all false
        _selectedFilters = results ?? kinitializedFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[FilterEnum.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[FilterEnum.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[FilterEnum.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CatergoryScreen(availableMeals: availableMeals);
    var activePageTitle = "Category Screen";
    if (selectedIndex == 1) {
      final _favoriteMeals = ref.watch(favoriteProvider);
      activeScreen = MealScreen(
        meals: _favoriteMeals,
      );
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
          selectedLabelStyle: const TextStyle(fontSize: 20),
          selectedIconTheme: const IconThemeData(
              size: 28, color: Color.fromARGB(255, 228, 102, 5)),
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          onTap: selectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_rounded),
              label: "Category",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
          ],
        ) //
        );
  }
}
