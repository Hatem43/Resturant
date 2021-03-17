import 'package:flutter/material.dart';

const KPrimaryDarkColor = Color(0xFF0c2233);
const KSubDarkColor = Color(0xFF065999);
const KBoxColor = Color(0xFF0a91ab);
const KPrimaryBrightColor = Color(0xFFffc045);

// --------------- HOME PAGE CONSTANTS ----------
const KCategoryTextStyle = TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xFFffc045));

const KProductNameTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: KPrimaryBrightColor,
);

const KProductPriceTextStyle = TextStyle(
  color: KPrimaryBrightColor,
  fontWeight: FontWeight.w900,
);

const KProductCardDecoration = BoxDecoration(color: KBoxColor, boxShadow: [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.10),
    blurRadius: 4.0,
    spreadRadius: 1.0,
    offset: Offset(
      0,
      4.0,
    ),
  )
]);

// --------------- PRODUCT DESCRIPTION CONSTANTS ----------

const KProductDetailsNameTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: KPrimaryBrightColor,
);

const KProductDetailsPriceTextStyle =
    TextStyle(color: KPrimaryBrightColor, fontSize: 20.0);

const KProductDescriptionTitleTextStyle = TextStyle(
  color: KBoxColor,
  fontWeight: FontWeight.w700,
  fontSize: 20,
);
const KProductDescriptionTextStyle = TextStyle(
  color: KBoxColor,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

// --------------- DRAWER CONSTANTS ----------

const KDrawerBoxDecoration = BoxDecoration(
    color: KPrimaryDarkColor,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0)),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.10),
        blurRadius: 4.0,
        spreadRadius: 1.0,
        offset: Offset(
          0,
          4.0,
        ),
      )
    ]);

// --------------- Shopping cart CONSTANTS ----------
const KCartCountTextStyle = TextStyle(
    color: KPrimaryDarkColor, fontWeight: FontWeight.w800, fontSize: 20);

