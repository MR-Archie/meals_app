import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

// ignore: use_key_in_widget_constructors
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: sort_child_properties_last
    return GridView(
      padding: const EdgeInsets.all(25),
      // ignore: sort_child_properties_last
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2, // It defines the height to width ratio
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
