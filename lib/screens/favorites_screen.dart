import 'package:flutter/material.dart';
import 'package:flutter_app/module/meal.dart';
import 'package:flutter_app/widgets/mealitem.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  FavoritesScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {

    if(favoritesMeals.isEmpty){
      return  Center(
        child: Text('You have no Favorites yet -start adding some!'),
      );
    }
    else{
      return ListView.builder(
        itemCount: favoritesMeals.length,
        itemBuilder: (context,int index){
          return MealItem(
            imageUrl:favoritesMeals[index].imageUrl,
            title:favoritesMeals[index].title,
            duration:favoritesMeals[index].duration,
            affordability:favoritesMeals[index].affordability,
            complexity:favoritesMeals[index].complexity,
            id:favoritesMeals[index].id,
          );
        },
      );
    }
  }
}
