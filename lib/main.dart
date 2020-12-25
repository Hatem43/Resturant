import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/components/products.dart';
import 'package:flutter_app/pages/cart.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email="";
  String password="";
  final _formkey=GlobalKey<FormState>();
   Widget image_carousel=Container(
     height: 200,
     child: Carousel(
       dotBgColor: Colors.transparent,
       boxFit: BoxFit.cover,
       images: [
         AssetImage('images/download.jpg'),
         AssetImage('images/m1.jpg'),
         AssetImage('images/w3.jpg'),
         AssetImage('images/w4.jpg'),
         AssetImage('images/m3.jpg'),
       ],
       autoplay: false,
       // animationCurve: Curves.fastOutSlowIn,
       // animationDuration: Duration(milliseconds: 1000),
       dotSize: 4.0,
       indicatorBgPadding: 2.0,
     ),
   );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('MoviesApp'),
        actions: [
          FlatButton.icon(
            label: Text('Add film',style: TextStyle(fontSize: 15),),
            icon: Icon(Icons.add,color: Colors.white),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text('Please confirm your email'),
                    content: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'email',
                            ),
                            validator: (val)=>val!="hatemmadouh25@gmail.com"?'not allowed':null,
                            onChanged: (val){
                              setState(() {
                                email=val;
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'password',
                            ),
                            obscureText: true,
                            validator: (val)=>val!="1234567890"?'not allowed':null,
                            onChanged: (val){
                              setState(() {
                                password=val;
                              });
                            },
                          ),
                          RaisedButton(
                            color: Colors.black,
                              child: Text('Confirm',style: TextStyle(color: Colors.white),),
                              onPressed: (){
                              if(_formkey.currentState.validate()){
                             //   Navigator.push(context, MaterialPageRoute(builder:(context)=>Addfilm());
                              }
                              }
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.close),
                          onPressed: (){
                            Navigator.of(context).pop();
                          }
                      ),
                    ],
                  );
                }
              );
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProducts()));
            },
          ),
          IconButton(
              icon: Icon(Icons.favorite,color: Colors.red),
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cart()));
              }
          ),
        ],
    ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Vendor'),
                accountEmail: Text('hatemmadouh25@gmail.com'),
              currentAccountPicture: GestureDetector(
                child:CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,),
                )
              ),
            ),
            //body
            ListTile(
             title: Text('Home Page'),
              leading: Icon(Icons.home,color: Colors.blue),
              onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
              },
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.favorite,color: Colors.red,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cart()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.help,color: Colors.green),
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('About us',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('this page is for booking movies online at any time,you can choose your seat and we have discounts every month,there are different kinda of films where you can choose from ,you can also save film you like to your favorites list from where you can watch it multiple times any time you want,you can also view the latest added films from notifications you get from the app after you created an email'),
                            SizedBox(height: 80),
                            Text('Copy Rights reserved for 2020-2021',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                          ],
                        ),
                        actions: [
                          IconButton(
                              icon: Icon(Icons.close),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                          ),
                        ],
                      );
                    }
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book_online,color: Colors.blue,),
              title: Text('book film seat',style: TextStyle(fontSize: 20),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.red,),
              title: Text('Log out',style: TextStyle(fontSize: 20),),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Top movies',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          //image carousel starts here
          image_carousel,
          Padding(
              padding: EdgeInsets.all(8.0),
                  ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Recent Movies',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          //grid view starts here
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}



