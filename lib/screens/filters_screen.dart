import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='/filters';
  
  final  Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   bool _isGluttenFree=false;
   bool _isLactoseFree=false;
   bool _isVegan=false;
   bool _isVegetarian=false;

   @override
   initState(){ //this will update their initial values to the currentvalues
      _isGluttenFree=widget.currentFilters['gluten'];
      _isLactoseFree=widget.currentFilters['lactose'];
      _isVegan=widget.currentFilters['vegan'];
      _isVegetarian=widget.currentFilters['vegetarian'];
     super.initState();
   }

   Widget buildSwitchListtile(String title,String description,bool currentvalue,Function updatevalue){
     return SwitchListTile(
       title: Text(title),
       subtitle: Text(description),
       value:currentvalue , //this is the initial value of the switch
       onChanged:updatevalue,
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                final selectedFilters={
                  'gluten':_isGluttenFree, //it will equal the initial value for _IsGluttenFree
                  'lactose':_isLactoseFree,
                  'vegan':_isVegan,
                  'vegetarian':_isVegetarian,
                };

                widget.saveFilters(selectedFilters);
              }, //this will allow us to implement the function
          ),
        ],
      ),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',style:Theme.of(context).textTheme.title),
          ),
          Expanded( //this will allow Listview to take all  the remaining spaces
            child: ListView(
              children: [
                buildSwitchListtile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _isGluttenFree,
                      (newvalue){
                  setState(() {
                     _isGluttenFree=newvalue;
                  });
                  },
                  ),
                buildSwitchListtile(
                  'Lactose-free',
                  'Only include Lactose-free meals',
                  _isLactoseFree,
                      (newvalue){
                    setState(() {
                      _isLactoseFree=newvalue;
                    });
                  },
                ),
                buildSwitchListtile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _isVegetarian,
                      (newvalue){
                    setState(() {
                      _isVegetarian=newvalue;
                    });
                  },
                ),
                buildSwitchListtile(
                  'Vegan',
                  'Only include Vegan meals',
                  _isVegan,
                      (newvalue){
                    setState(() {
                      _isVegan=newvalue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
