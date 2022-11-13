// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import './screens/category_meals_screen.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// Donot use the filter or other logic inside the build widget as it rebuilds the app from the start

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void toggleFavourites(String mealId) {
    final existingMeal =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingMeal >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingMeal);
      });
    } else {
      setState(
        () {
          _favouriteMeals
              .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        },
      );
    }
  }

  bool isFavourite(String mealId) {
    return _favouriteMeals.any((meal) => mealId == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.lightGreen,
        canvasColor: const Color.fromARGB(255, 254, 254, 254),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(
                color: Colors.black,
              ),
              bodyText1: const TextStyle(
                color: Colors.deepPurple,
              ),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        '/filters': (context) => FiltersScreen(_filters, _setFilters),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        '/meal-detail': (context) => MealDetailScreen(toggleFavourites,isFavourite),
      },
    );
  }
}
