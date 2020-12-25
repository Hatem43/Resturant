import 'package:flutter/material.dart';
import 'package:flutter_app/components/cart_product.dart';
import 'package:flutter_app/main.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('My Favorites',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Cart_products(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home,color: Colors.blue),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
