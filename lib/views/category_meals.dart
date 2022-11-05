import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMeals(this.categoryId, this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text('The Recipe');
          },
          itemCount: 5),
    );
  }
}
