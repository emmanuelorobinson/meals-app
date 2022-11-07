import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const Favorites(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'You have no favorites yet - start adding some!',
          style: TextStyle(color: Colors.black),
        ),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length);
    }
  }
}
