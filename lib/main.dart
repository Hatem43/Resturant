import 'package:flutter/material.dart';
import 'package:flutter_app/dummy_data.dart';
import 'package:flutter_app/module/meal.dart';
import 'package:flutter_app/screens/category_meals_screen.dart';
import 'package:flutter_app/screens/filters_screen.dart';
import 'package:flutter_app/screens/meal_detail_screen.dart';
import 'package:flutter_app/screens/tabs_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _avaliableMeals=DUMMY_MEALS; //this will store the meals in Dummy meals list in available meals
  List<Meal> _favoritesMeals=[];

    void _setFilters(Map<String,bool> _filtersData){
       setState(() {
         _filters=_filtersData; //this will update the values in _filters map

         _avaliableMeals=DUMMY_MEALS.where((meal) { //this will filter all the meals in DummyMeals list
           if(_filters['gluten'] && !meal.isGluttenFree){ //means that the gluten value in _filters=true but meal doesn't contain gluten
                return false;
           }
           if(_filters['lactose'] && !meal.isLactoseFree){
             return false;
           }
           if(_filters['vegan'] && !meal.isVegan){
             return false;
           }
           if(_filters['vegetarian'] && !meal.isVegetarian){
             return false;
           }
           return true;
         }).toList();
       });
    }

    void _toggleFavorites(String mealId){
    final existingIndex= _favoritesMeals.indexWhere((meal) => meal.id==mealId); //this will return the index of object the satisfy the condition
      if(existingIndex>=0){
        setState(() {
          _favoritesMeals.removeAt(existingIndex); //this will remove the meal if it's already in the favorites and the user click on add to favorites
        });
      }
      else{
        setState(() {
          _favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId)); //this will add the meal to the favorites
        });
      }
    }

    bool _isMealFavorite(String id){ //this will check if the meal is already in the favorites meals or not
      return _favoritesMeals.any((meal)=> meal.id==id);
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) =>tabsScreen(_favoritesMeals),
        CategoryMealsScreen.routename:(context) => CategoryMealsScreen(_avaliableMeals),
        MealDetailScreen.routename:(context) => MealDetailScreen(_toggleFavorites,_isMealFavorite),
        FiltersScreen.routeName:(context) => FiltersScreen(_setFilters,_filters),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255,254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          bodyText2: TextStyle(
           color: Color.fromRGBO(20, 50, 50, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body:null,
    );
  }
}
