import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/Components/Navigator.dart';
import 'package:shopping_app/Components/SizeConfig.dart';
import 'package:shopping_app/Components/Carousel.dart';
import 'package:shopping_app/Components/ScaffoldWithAppBar.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Models/ProductsModel.dart';
import 'package:shopping_app/Models/Search_Model.dart';
import 'package:shopping_app/Models/Interface.dart';
import 'package:shopping_app/Screens/Shopping_Cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with Interface {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: ScaffoldWithAppBar(
        body: ListView(
          children: [
            imagecarousel,
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.defaultSize * 2,
                left: SizeConfig.defaultSize - 2,
              ),
              child: Text(
                'Browse Products:',
                style: KProductNameTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.defaultSize * 2),
              height: SizeConfig.defaultSize * 45,
              child: ProductsStream(),
            ),
          ],
        ),
        icon1: Icon(Icons.search),
        iconButtonAction1: () => showSearch(
          context: context,
          delegate: Search(),
        ),
        icon2: Icon(Icons.shopping_cart),
        iconButtonAction2: buttonsAction,
        drawer: true,
      ),
      onWillPop: _onWillPop,
    );
  }

// ignore: missing_return
  Future<bool> _onWillPop() {
    SystemNavigator.pop();
  }

  @override
  void buttonsAction() {
    Router().navigator(context, Cart());
  }
}
