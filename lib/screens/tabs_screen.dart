// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';
import '../models/meal.dart';

// ignore: use_key_in_widget_constructors
class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {"pages": CategoriesScreen(), "title": "Categories"},
      {
        "pages": FavouritesScreen(widget.favouriteMeals),
        "title": "Your Favourites"
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]["pages"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        elevation: 10,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "Favourites",
          ),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
