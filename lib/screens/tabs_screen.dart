import 'package:flutter/material.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/favorites_screen.dart';
import 'package:flutter_app/widgets/main_drawer.dart';
import 'package:flutter_app/module/meal.dart';
class tabsScreen extends StatefulWidget {

  final List<Meal> favoritesMeals;
  tabsScreen(this.favoritesMeals);
  @override
  _tabsScreenState createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
   List<Map<String,Object>> _pages;
  int selectedpageindex=0;
  @override
  void initState(){
   _pages=[
    {
    'page':Categoriesscreen(),
    'title':'Categories',
    },
    {
    'page':FavoritesScreen(widget.favoritesMeals), //this will allow favorites_screen to access favoritesmeals
    'title':' Your Favorites',
    },
   ];
   super.initState();
  }



  void _x(int value){
   setState(() {
     selectedpageindex=value;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedpageindex]['title']),
      ),
      body: _pages[selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedpageindex,
        onTap: _x,
        backgroundColor: Theme.of(context).primaryColor,
        items:[
          BottomNavigationBarItem(
              icon:Icon(Icons.category),
              title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
      drawer:MainDrawer(),
    );
  }
}
