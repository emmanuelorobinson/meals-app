import 'package:flutter/material.dart';

import '../models/meal.dart';
import './categories.dart';
import './favorites.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List favoriteMeals;

  const TabScreen(this.favoriteMeals, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  late List<Map<String, Object>> _pages;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': const Categories(),
        'title': 'Categories',
      },
      {
        'page': Favorites(widget.favoriteMeals as List<Meal>),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,

      //put navigation bar on the bottom floating from the bottom and on top of the body
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
