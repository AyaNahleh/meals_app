import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';
class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen({Key? key, required this.availableMeals}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void initState() {

    super.initState();
  }
  // void _removeMeal(String mealId){
  //   setState((){
  //     displayedMeals.removeWhere((element) => element.id==mealId);
  //   });
  // }
  @override
  void didChangeDependencies() {
    final Map routArgs= ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    categoryTitle=routArgs['title'];
    final categoryId=routArgs['id'];
    displayedMeals=widget.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
       return MealItem(
         id: displayedMeals[index].id,
           title: displayedMeals[index].title,
           imageUrl: displayedMeals[index].imageUrl,
           duration: displayedMeals[index].duration,
           complexity: displayedMeals[index].complexity,
           affordability: displayedMeals[index].affordability);
      },itemCount: displayedMeals.length,),

    );
  }
}
