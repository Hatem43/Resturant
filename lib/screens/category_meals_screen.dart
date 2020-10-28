import 'package:flutter/material.dart';
import 'package:flutter_app/dummy_data.dart';
import 'package:flutter_app/module/meal.dart';
import 'package:flutter_app/widgets/mealitem.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routename='category_meals';

  final List<Meal> _avaliableMeals;

  CategoryMealsScreen(this._avaliableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categorytitle;
  List<Meal> displayedMeals;
  @override
  void didChangeDependencies() {
    final routeArg=ModalRoute.of(context).settings.arguments as Map<String ,String>; //this will help reach the arguments
    final categoryid=routeArg['id'];
    categorytitle=routeArg['title'];
    displayedMeals=widget._avaliableMeals.where((meal) { // this will access only the filtered meals not all the meals in dummy.dart
      return meal.categories.contains(categoryid); // this will check that list contains same category
    }).toList();
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) =>meal.id==mealId); //this will remove the meal whose id is equal to the passed id [MealId] from the displayedMeals list
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (context,int index){
            return MealItem(
               imageUrl:displayedMeals[index].imageUrl,
                title:displayedMeals[index].title,
                duration:displayedMeals[index].duration,
                affordability:displayedMeals[index].affordability,
                complexity:displayedMeals[index].complexity,
                id:displayedMeals[index].id,
            );
          },
      ),
    );
  }
}
