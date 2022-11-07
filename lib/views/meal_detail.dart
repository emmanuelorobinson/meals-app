import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  final Function toggleFavorite;
  final Function isMealFavorite;

  const MealDetail(this.toggleFavorite, this.isMealFavorite, {super.key});

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                      backgroundColor: Theme.of(context).accentColor,
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
