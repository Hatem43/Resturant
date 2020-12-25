import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart=[
    {
      'name':'GrayHound',
      'picture':'images/w3.jpg',
      'price':60,
      'hours':2,
      'seats':1,

    },
    {
      'name':'ToyStory',
      'picture':'images/products/e5.jpg',
      'price':53,
      'hours':2,
      'seats':1,
    },
    {
      'name':'Sonic',
      'picture':'images/m1.jpg',
      'price':50,
      'hours':2,
      'seats':1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
        itemBuilder: (context,int index){
            return Single_cart_product(
              cart_prod_name: Products_on_the_cart[index]['name'],
              cart_prod_picture: Products_on_the_cart[index]['picture'],
              cart_prod_price: Products_on_the_cart[index]['price'],
              cart_prod_seats: Products_on_the_cart[index]['seats'],
              cart_prod_hours: Products_on_the_cart[index]['hours'],
              cart_total: Products_on_the_cart[index]['price'],
              prod_price: Products_on_the_cart[index]['price'],
            );
        }
    );
  }
}
class Single_cart_product extends StatefulWidget {
  final cart_prod_name;
  final cart_prod_picture;
  int cart_prod_price;
  final cart_prod_hours;
  final cart_prod_Qty;
  int cart_prod_seats;
  int cart_total;
  int prod_price;

  Single_cart_product({
    this.cart_prod_hours,
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_Qty,
    this.cart_prod_seats,
    this.cart_total,
    this.prod_price,
  });

  @override
  _Single_cart_productState createState() => _Single_cart_productState();
}

class _Single_cart_productState extends State<Single_cart_product> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            //this secion for the image
            leading: Image.asset(widget.cart_prod_picture,width: 80,height: 80,),
            //this for the name of product
            title: Text(widget.cart_prod_name),
            //this for subtitle
            subtitle: Column(
              children: [
                Row(
                  children: [
                    //This for size of the product
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('hours:'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('${widget.cart_prod_hours}',style: TextStyle(color: Colors.red),),
                    ),
                  ],
                ),
                //this for the product price
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('\$${widget.cart_prod_price}',style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  ),
                ),
              ],
            ),
            trailing: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){
                    setState(() {
                      widget.cart_prod_seats+=1;
                      widget.cart_prod_price+=widget.prod_price;
                      widget.cart_total=widget.cart_prod_price;
                    });
                  }),
                  Text('${widget.cart_prod_seats}'),
                  IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){
                    setState(() {
                      widget.cart_prod_seats-=1;
                    });
                  }),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text('Total:'),
                  subtitle: Text('\$${widget.cart_total}'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  child: Text('check out',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
