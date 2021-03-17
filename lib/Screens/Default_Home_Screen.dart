import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Components/SizeConfig.dart';
import 'package:shopping_app/Components/Carousel.dart';
import 'package:shopping_app/Components/Navigator.dart';
import 'package:shopping_app/Components/ScaffoldWithAppBar.dart';
import 'package:shopping_app/Models/ProductsModel.dart';
import 'package:shopping_app/Models/Interface.dart';
import 'package:shopping_app/Models/Search_Model.dart';
import 'package:shopping_app/Screens/SignIn.dart';
import 'package:shopping_app/Screens/SignUp.dart';

class DefaultHome extends StatefulWidget {
  @override
  _DefaultHomeState createState() => _DefaultHomeState();
}

class _DefaultHomeState extends State<DefaultHome> with Interface {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: ScaffoldWithAppBar(
        icon1: Icon(Icons.search),
        iconButtonAction1: () => showSearch(
          context: context,
          delegate: Search(),
        ),
        icon2: Icon(Icons.group_add),
        iconButtonAction2: buttonsAction,
        drawer: false,
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
    showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: KPrimaryDarkColor,
          elevation: 1.0,
          content: Text(
            'Welcome to Shop It',
            style: TextStyle(
              color: KPrimaryBrightColor,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          actions: [
            ButtonTheme(
              child: RaisedButton(
                  color: KPrimaryBrightColor,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: KPrimaryDarkColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Router().navigator(context, SignUp());
                  }),
            ),
            ButtonTheme(
              child: RaisedButton(
                  color: KPrimaryBrightColor,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: KPrimaryDarkColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Router().navigator(context, SignIn());
                  }),
            ),
          ],
        ));
  }

  /*void searchAction() {
    showSearch(context: null, delegate: null);
  }*/
}
