// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget listTileBuild(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 26,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!!",
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 20),
          listTileBuild("Meals", Icons.food_bank,
              () => Navigator.pushReplacementNamed(context, '/')),
          listTileBuild("filters", Icons.settings,
              () => Navigator.pushReplacementNamed(context, '/filters')),
        ],
      ),
    );
  }
}
