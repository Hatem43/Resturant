import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopping_app/Components/Constants.dart';

Widget imagecarousel = new Container(
  height: 200.0,
  child: new Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('images/Carsuol1.jpg'),
      AssetImage('images/Carsuol3.jpg'),
      AssetImage('images/Carsuol2.jpg'),
      AssetImage('images/Carsuol4.jpg'),
    ],
    autoplay: true,
    //showIndicator: false,
    dotBgColor: KSubDarkColor,
    dotColor: KPrimaryBrightColor,
    dotIncreasedColor: KPrimaryBrightColor,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),
    dotSize: 6.0,
    indicatorBgPadding: 2.0,
  ),
);

