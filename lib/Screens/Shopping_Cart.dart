import 'package:flutter/material.dart';
import 'package:shopping_app/Components/SizeConfig.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Models/Shopping_Cart_Model.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: KPrimaryDarkColor,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.defaultSize * 3,
              left: SizeConfig.defaultSize - 2,
            ),
            child: Text(
              'Products in shopping cart:',
              style: KProductNameTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.defaultSize * 2.5),
            height: SizeConfig.defaultSize * 65,
            child: ProductsStream(),
          ),
        ],
      ),
    );
  }
}
