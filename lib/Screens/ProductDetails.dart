import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Components/Navigator.dart';
import 'package:shopping_app/Components/SizeConfig.dart';
import 'package:shopping_app/Components/FlushBar.dart';
import 'package:shopping_app/Models/Interface.dart';
import 'package:shopping_app/Screens/SignIn.dart';
import 'package:shopping_app/Screens/SignUp.dart';
import 'package:shopping_app/Screens/Shopping_Cart.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    this.name,
    this.price,
    this.image,
    this.desc,
    this.id,
    this.docID,
  });
  final String name;
  final String price;
  final String image;
  final String desc;
  final String id;
  final String docID;
  @override
  _ProductDetailsState createState() => _ProductDetailsState(
      productName: name,
      productPrice: price,
      productImage: image,
      productDesc: desc,
      productId: id,
      productDocID: docID);
}

class _ProductDetailsState extends State<ProductDetails> with Interface {
  _ProductDetailsState({
    this.productName,
    this.productPrice,
    this.productImage,
    this.productDesc,
    this.productId,
    this.productDocID,
  });
  final String productName;
  final String productPrice;
  final String productImage;
  final String productDesc;
  final String productId;
  final String productDocID;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: KPrimaryDarkColor,
      floatingActionButton: FloatingActionButton(
        onPressed: buttonsAction,
        backgroundColor: KPrimaryBrightColor,
        elevation: 1.0,
        child: Icon(
          Icons.add_shopping_cart,
          color: KPrimaryDarkColor,
          size: 35.0,
        ),
      ),
      body: ListView(
        children: <Widget>[
          // Product Picture
          Container(
            height: 300.0,
            child: Container(
              color: Colors.white,
              child: Image.network(productImage),
            ),
          ),
          //Name and Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 8.0),
                child: Text(
                  "Product Name: $productName",
                  style: KProductDetailsNameTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 12.0),
                child: Text(
                  "Product Price: ${productPrice}LE",
                  style: KProductDetailsPriceTextStyle,
                ),
              ),
            ],
          ),
          Divider(),
          // PRODUCT DETAILS
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Text(
                "Product Description",
                style: KProductDescriptionTitleTextStyle,
              ),
            ),
            subtitle: Text(
              productDesc,
              style: KProductDescriptionTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void buttonsAction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    email == null
        ? showDialog(
            context: context,
            child: AlertDialog(
              backgroundColor: KPrimaryDarkColor,
              elevation: 1.0,
              content: Text(
                'Sign in or Sign up to add this product to cart',
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
            ))
        : action();
  }

  final fireStore = Firestore.instance;
  void action() async {
    //Check if there is internet connection or not and display message error if not.
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Warning().errorMessage(context,
          title: "No internet connection !",
          message: "Pleas turn on wifi or mobile data",
          icons: Icons.signal_wifi_off);
    } else {
      try {
        //Create instance of Shared Preferences.
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var userEmail = prefs.getString('email');

        final docs =
            await fireStore.collection('users').document(userEmail).get();
        int cartIndex = docs['CartIndex'];
        List<dynamic> cartList = docs['CartIDS'];

        cartList.insert(cartIndex + 1, productDocID);
        await fireStore.collection('users').document(userEmail).updateData({
          'CartIndex': cartIndex + 1,
          'CartIDS': cartList,
        });

        Router().navigator(context, Cart());
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
