import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorite',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
        ),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     // initialIndex: 0,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Meals'),
  //         bottom: const TabBar(
  //           tabs: <Widget>[
  //             Tab(
  //               icon: Icon(
  //                 Icons.category,
  //               ),
  //               text: 'Categories',
  //             ),
  //             Tab(
  //               icon: Icon(
  //                 Icons.star,
  //               ),
  //               text: 'Favorites',
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: <Widget>[
  //           CategoriesScreen(),
  //           FavoritesScreen(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
