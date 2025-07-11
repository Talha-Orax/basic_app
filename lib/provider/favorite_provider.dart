import "package:basic_app/model/meal.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

///
class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  ///this is the contructor of the class which initialzed the list of meal
  FavoriteMealNotifier() : super([]);

  ///this is the function to toggle the favorte meal and add remove and add it
  ///current meal in the funtion parameter is the current active meal marked or unmarked as fav
  bool onToogleFavoriteMeal(Meal meal) {
    ///ismealfavorite check is meal already in the state(favoritemeals) list or not
    final ismealfavorite = state.contains(meal);

    /// if the meal is already peresent in the state(favoritemeals) list then is will skip it and keep others by makign new state list
    if (ismealfavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return true;
    } else {
      // in this the elements of the state adds the new elements
      state = [...state, meal];
      return false;
    }
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});
