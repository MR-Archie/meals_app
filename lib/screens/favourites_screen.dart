import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

// ignore: use_key_in_widget_constructors
class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return (const Center(
        child: Text("No meals added yet!! Try adding some :)",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ));
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                favouriteMeals[index].id,
                favouriteMeals[index].title,
                favouriteMeals[index].imageUrl,
                favouriteMeals[index].duration,
                favouriteMeals[index].complexity,
                favouriteMeals[index].affordability);
          },
          itemCount: favouriteMeals.length);
    }
  }
}
