import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/Components/Constants.dart';

final _firestore = Firestore.instance;

class ProductsStream extends StatefulWidget {
  @override
  _ProductsStreamState createState() => _ProductsStreamState();
}

class _ProductsStreamState extends State<ProductsStream> {
  List<SingleProduct> productsList = [];
  void getShoppingCartProducts() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var currentUserDoc = pref.getString('email');
    final doc =
        await _firestore.collection('users').document(currentUserDoc).get();
    final List<dynamic> cartList = doc['CartIDS'];
    int index = cartList.length;
    print(index);
    List<SingleProduct> productsFromDBList = [];
    try {
      for (int i = 0; i < index; ++i) {
        final docs =
            await _firestore.collection('Products').document(cartList[i]).get();
        final productName = docs['Name'];
        final productPrice = docs['Price'];
        final productImage = docs['Image'];
        final productID = docs['ID'];

        final productCard = SingleProduct(
          productName: productName,
          productPic: productImage,
          productPrice: productPrice,
          id: productID,
        );

        productsFromDBList.add(productCard);
        setState(() {
          productsList = productsFromDBList;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getShoppingCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productsList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return productsList[index];
        });
  }
}

class SingleProduct extends StatelessWidget {
  SingleProduct({
    this.productName,
    this.productPic,
    this.productPrice,
    this.id,
  });
  final String productName;
  final String productPic;
  final String productPrice;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: id,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                decoration: KProductCardDecoration,
                child: ListTile(
                  leading: Text(
                    productName,
                    style: KProductNameTextStyle,
                  ),
                  title: Text(
                    '${productPrice}LE',
                    style: KProductPriceTextStyle,
                  ),
                ),
              ),
              child: Image.network(
                productPic,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
