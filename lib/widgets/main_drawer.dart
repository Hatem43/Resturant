import 'package:flutter/material.dart';
import 'package:flutter_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListtile(String title,IconData icon,Function tapHandler){
    return ListTile(
      leading: Icon(icon,size: 26),
      title: Text(title,style: TextStyle(
        fontSize: 24,
        fontFamily:'RobotoCondensed',
        fontWeight: FontWeight.bold,
      ),
      ),
      onTap: tapHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up',style: TextStyle(
                color:Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900
            ),
            ),
          ),
          SizedBox(height: 20),
          buildListtile('Meal', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListtile('Filters', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
