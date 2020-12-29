import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list=[
    {
      'name':'Avengers',
      'picture':'images/movie0.jpg',
       'seats':47,
        'price':85,
    },
    {
      'name':'Moon Light',
      'picture':'images/movie1.jpg',
      'seats':47,
      'price':50,
    },
    {
      'name':'Joker',
      'picture':'images/movie2.jpg',
       'seats':47,
       'price':53,
    },
    {
      'name':'Beauty & Beast',
      'picture':'images/movie4.jpg',
      'seats':47,
      'price':60,
    },   
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context,int index){
        return Single_Film(
          film_name:product_list[index]['name'],
          film_seats:product_list[index]['seats'],
          film_price: product_list[index]['price'],
          film_picture: product_list[index]['picture'],
        );
      });
  }
}

class Single_Film extends StatelessWidget {
  final  String film_name;
  final String film_picture;
  final int film_seats;
  final int film_price;
  Single_Film({this.film_price,this.film_name,this.film_seats,this.film_picture});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text('hhkjnk'),
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CinemasPage());
            child: GridTile(
              child: Image.asset(film_picture,fit: BoxFit.cover,),
              footer: Container(
                color: Colors.white,
                child:Row(
                  children: [
                    Text(film_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                    SizedBox(width: 10,),
                    Text('seats:$film_seats'),
                    SizedBox(width: 5),
                    Text('\$$film_price',style: TextStyle(color: Colors.red),),
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
