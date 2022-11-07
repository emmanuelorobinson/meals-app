import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';
import './dummy_data.dart';
import 'views/tabs.dart';
import 'views/meal_detail.dart';
import 'views/category_meals.dart';
import 'views/categories.dart';
import 'views/filters.dart';

final Map<int, Color> _white900Map = {
  50: const Color.fromRGBO(255, 255, 255, .1),
  100: const Color.fromRGBO(255, 255, 255, .2),
  200: const Color.fromRGBO(255, 255, 255, .3),
  300: const Color.fromRGBO(255, 255, 255, .4),
  400: const Color.fromRGBO(255, 255, 255, .5),
  500: const Color.fromRGBO(255, 255, 255, .6),
  600: const Color.fromRGBO(255, 255, 255, .7),
  700: const Color.fromRGBO(255, 255, 255, .8),
  800: const Color.fromRGBO(255, 255, 255, .9),
  900: const Color.fromRGBO(255, 255, 255, 1),
};

final MaterialColor _white900 = MaterialColor(0xFFFFFFFF, _white900Map);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: _white900,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const MyHomePage(title: 'Meals'),
      home: TabScreen(_favoriteMeals),
      // routes: {
      //   '/categories': (context) => const Categories(),
      //   '/category-meals': (context) => CategoryMeals(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => TabScreen(_favoriteMeals), settings: settings);
          case CategoryMeals.routeName:
            return CupertinoPageRoute(
                builder: (_) => CategoryMeals(_availableMeals),
                settings: settings);
          case MealDetail.routeName:
            return CupertinoPageRoute(
                builder: (_) => MealDetail(_toggleFavorite, _isMealFavorite),
                settings: settings);
          case Filters.routeName:
            return CupertinoPageRoute(
                builder: (_) => Filters(_filters, _setFilters),
                settings: settings);
        }
      },
    );
  }
}
