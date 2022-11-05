import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/category_meals.dart';
import 'views/categories.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const Categories(),
      // routes: {
      //   '/categories': (context) => const Categories(),
      //   '/category-meals': (context) => CategoryMeals(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => Categories(), settings: settings);
          case CategoryMeals.routeName:
            return CupertinoPageRoute(
                builder: (_) => CategoryMeals(), settings: settings);
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Navigation'),
      ),
    );
  }
}
