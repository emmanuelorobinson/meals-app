import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: <Widget>[
        for (final category in DUMMY_CATEGORIES)
          CategoryItem(category.id, category.title, category.color),
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
