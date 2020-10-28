import 'package:flutter/material.dart';
import 'package:flutter_app/screens/category_meals_screen.dart';
class Categoryitem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const Categoryitem({ @required this.id, @required this.color,@required this.title});

  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealsScreen.routename,
        arguments:{
        'id':id,
          'title':title,
        },
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.headline6) ,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors:[
              color.withOpacity(0.4),
              color,
            ],
              begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
