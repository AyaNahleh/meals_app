import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);
  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List _pages;

  int _selectedPageIndex=0;
  void _selectPage(int index){
    setState((){
      _selectedPageIndex=index;
    });

  }
  @override
  void initState() {
    _pages=[
      {'page':const CategoriesScreen(),'title':'Categories'},
      {'page':FavoritesScreen(favoriteMeals:widget.favoriteMeals),'title':'Your Favorites'}
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // this give you tabBar at top
    // return DefaultTabController(
    //   length: 2,
    //   child:
    return Scaffold(
      drawer: const Drawer(
        child: MainDrawer(),
      ),

      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        // title: Text('Meals'),
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: 'Favorites',
        //     ),
        //   ],
        // ),
      ),
      body:_pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amberAccent,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
      // TabBarView(
      //   children: [
      //     CategoriesScreen(),
      //     FavoritesScreen(),
      //   ],
      // ),
    );
  }
}
