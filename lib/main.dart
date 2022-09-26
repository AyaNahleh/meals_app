import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/filters_screen.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List <Meal> _availableMeals=dummyMeals;
  final List<Meal> _favoriteMeals=[];
  void _setFilters(Map filterData ){
  setState((){
    _filters=filterData;
    _availableMeals =dummyMeals.where((element) {
     if(_filters['gluten']&& !element.isGlutenFree){
       return false;
     }
     if(_filters['lactose']&& !element.isLactoseFree){
       return false;
     }
     if(_filters['vegan']&& !element.isVegan){
       return false;
     }
     if(_filters['vegetarian']&& !element.isVegetarian){
       return false;
     }
     return true;
    }).toList();
  });
  }
  void _toggleFavorite(String mealId){
   final existingIndex= _favoriteMeals.indexWhere((element) => element.id==mealId);
   if(existingIndex>=0){
     setState((){
       _favoriteMeals.removeAt(existingIndex);
     });
   }else {
     setState((){
       _favoriteMeals.add(dummyMeals.firstWhere((element) => element.id==mealId));
     });
   }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.grey[200],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(29, 51, 51, 1),
          ),
          bodyText2: const TextStyle(color: Color.fromRGBO(29, 51, 51, 1),
        ),
          headline1: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          ),


      ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':  (ctx)=>TabsScreen(favoriteMeals:_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(toggleFavorite: _toggleFavorite,isFavorite: _isMealFavorite),
        FilterScreen.routeName:(ctx)=>FilterScreen(saveFilters: _setFilters,currentFilter: _filters),

      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },

    );
  }
}





