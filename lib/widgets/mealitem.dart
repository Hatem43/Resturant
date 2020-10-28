import 'package:flutter/material.dart';
import 'package:flutter_app/module/meal.dart';
import 'package:flutter_app/screens/meal_detail_screen.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {
        @required this.title,
        @required this.duration,
        @required this.imageUrl,
        @required this.affordability,
        @required this.complexity,
        @required this.id,
      });

  String get complexityText{ //this will check about complexity states and return with String text of type enum
     switch(complexity){
       case Complexity.Simple:return "simple"; break;
       case Complexity.Challenging:return "Challenging"; break;
       case Complexity.Hard:return "Hard"; break;
       default: return "Unknown"; break; // this will happen when the state is unknown
     }
}

String get affordabilityText{
    switch(affordability){ //this will check about affordability states and return with String text of type enum
      case  Affordability.affordable: return 'Affordable'; break;
      case  Affordability.Pricey: return 'Pricey'; break;
      case  Affordability.Luxurious: return 'Luxurious'; break;
      default: return "Unknown"; break; // this will happen when the state is unknown
    }
}

  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(MealDetailScreen.routename,
    arguments: id,
    )
        .then((result) { //this will store the value returned[mealId] in variable [result]
     // if (result!=null) removeItem(result); // this line  will remove this item of id equal to [MealId]
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
       selectMeal(context);
      },
      child:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation:4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect( //this allow us to make the image sides to be circularly
                  child: Image.network(imageUrl,height: 200,width: double.infinity,fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade
                    ),
                  ),
                ), //this will view the title of each meal
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Row(
                   children: [
                     Icon(Icons.schedule),
                     SizedBox(width:6),
                     Text('$duration min'),
                   ],
                 ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width:6),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width:6),
                      Text('$affordabilityText'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
