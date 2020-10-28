import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  static const routename='meal_detail';
  final Function toggleFavorites;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorites,this.isFavorite);

  Widget buildSectionTitle(String text,BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,style: Theme.of(context).textTheme.title),
    );
  }
  Widget buildContainer(Widget child){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child:child,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String; //this will take the value of id and convert it to string and store it into mealId
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId); //this will take the objects that only specify the condition
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.ingerdients.length,
                itemBuilder: (context,int index){
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(selectedMeal.ingerdients[index]),
                    ),
                  );
                },
              )),
            buildSectionTitle("Steps", context),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context,int index){
                return Column(
                  children: [
                ListTile(
                title: Text(selectedMeal.steps[index]),
                leading: CircleAvatar(
                child: Text('# ${index+1}'),
                ),
                ),
                    Divider(),
                  ],
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          toggleFavorites(mealId); //this will delete/add meal to the favorites specific MealId
        },
        child:Icon(
    isFavorite(mealId)? Icons.star:Icons.star_border,
      ),
    ),
    );
  }
}
