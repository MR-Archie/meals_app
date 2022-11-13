import 'package:flutter/material.dart';

import '../models/meal.dart';

// ignore: use_key_in_widget_constructors
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  // ignore: missing_return
  String get complexityText {
    switch (complexity) {
      case Complexity.easy:
        return ("Easy");
        break;

      case Complexity.challenging:
        return ("Challenging");
        break;

      case Complexity.difficult:
        return ("Difficult");
        break;
    }
  }

// ignore: missing_return
  String get affordabilityText {
    switch (affordability) {
      case Affordability.inexpensive:
        return ("Inexpensive");
        break;

      case Affordability.affordable:
        return ("Affordable");
        break;

      case Affordability.costly:
        return ("Costly");
        break;
    }
  }

  MealItem(
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  );

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal-detail', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    width: 280,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule_outlined),
                      const SizedBox(width: 5),
                      Text(
                        "$duration min",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_outline_outlined),
                      const SizedBox(width: 5),
                      Text(
                        complexityText,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 5),
                      Text(
                        affordabilityText,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
