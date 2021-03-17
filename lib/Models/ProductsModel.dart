import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Components/Navigator.dart';
import 'package:shopping_app/Screens/ProductDetails.dart';

final _firestore = Firestore.instance;

class ProductsStream extends StatefulWidget {
  @override
  _ProductsStreamState createState() => _ProductsStreamState();
}

class _ProductsStreamState extends State<ProductsStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: KPrimaryDarkColor,
            ),
          );
        }
        final products = snapshot.data.documents.reversed;
        List<SingleProduct> productsList = [];
        for (var product in products) {
          final productName = product.data['Name'];
          final productPrice = product.data['Price'];
          final productImage = product.data['Image'];
          final productID = product.data['ID'];
          final productDesc = product.data['Description'];
          final doc = product.data['DocID'];

          final productCard = SingleProduct(
            productName: productName,
            productPic: productImage,
            productPrice: productPrice,
            id: productID,
            desc: productDesc,
            docID: doc,
          );

          productsList.add(productCard);
        }
        return GridView.builder(
            itemCount: productsList.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return productsList[index];
            });
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  SingleProduct({
    this.productName,
    this.productPic,
    this.productPrice,
    this.id,
    this.desc,
    this.docID,
  });
  final String productName;
  final String productPic;
  final String productPrice;
  final String id;
  final String desc;
  final String docID;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: id,
        child: Material(
          child: InkWell(
            onTap: () {
              Router().navigator(
                  context,
                  ProductDetails(
                    name: productName,
                    price: productPrice,
                    image: productPic,
                    desc: desc,
                    id: id,
                    docID: docID,
                  ));
            },
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
