import 'package:flutter/material.dart';
import 'package:shopping_app/Components/Navigator.dart';
import 'package:shopping_app/Screens/ProductDetails.dart';

class Search extends SearchDelegate<String> {
  var productsList = [
    //****************Blazers for men************************************/
    {
      "name": "Blazer for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/blazer%20for%20men1.jpg?alt=media&token=970f9d76-3f1b-46b1-a0d9-4878cfa036e4",
      "price": "88",
      "description": "Blue blazer for men",
    },
    {
      "name": "Blazer for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/blazer%20for%20men2.jpg?alt=media&token=8ef3e6f9-a5a3-4d07-a43b-9752ee88fa62",
      "price": "65",
      "description": "Black blazer for men",
    },
//****************Blazers for women************************************/
    {
      "name": "Blazer for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/blazer%20for%20women1.jpg?alt=media&token=577ea7eb-d902-4599-b8cc-ec58bf671fde",
      "price": "74",
      "description": "Blue and red blazer for women",
    },
    {
      "name": "Blazer for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/blazer%20for%20women2.jpg?alt=media&token=515f2233-d365-4cee-9fc8-2347376dfc7d",
      "price": "89",
      "description": "Gray blazer for women",
    },
    //****************Shirts for men************************************/
    {
      "name": "Shirt for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/shirts%20for%20men1.jpg?alt=media&token=22300b47-f036-4dcf-b66a-a9d139c208c3",
      "price": "89",
      "description": "Dark blue shirt for men",
    },
    {
      "name": "Shirt for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/shirts%20for%20men2.jpg?alt=media&token=2f4d9f9a-0f71-49c0-a115-d8bb83d9b3fe",
      "price": "77",
      "description": "Light blue shirt for men",
    },
//****************Shirts for women************************************/
    {
      "name": "Shirt for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/shirts%20for%20women1.jpg?alt=media&token=73075a63-6907-43ca-bf2b-13eaf1ac6951",
      "price": "66",
      "description": "Brown shirt for women",
    },
    {
      "name": "Shirt for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/shirts%20for%20women2.jpg?alt=media&token=1b7cfbf7-2f85-4d72-a3de-b4f5048d61b3",
      "price": "74",
      "description": "Blue shirt for women",
    },
    //****************Jackets for men************************************/
    {
      "name": "Jacket for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/jacket%20for%20men1.jpg?alt=media&token=ddc9469c-ee6b-46c0-8ade-d528102093e7",
      "price": "82",
      "description": "Brown jacket for men",
    },
    {
      "name": "Jacket for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/jacket%20for%20men2.jpg?alt=media&token=ff46b79a-bf98-4dc5-8ca3-9d872d332f8a",
      "price": "69",
      "description": "Blue jacket for men",
    },
//****************Jackets for women************************************/
    {
      "name": "Jacket for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/jacket%20for%20women1.jpg?alt=media&token=989a8b5a-ad32-4ca8-9259-ad4c0c1fe5d8",
      "price": "95",
      "description": "Blue jeans jacket for women",
    },
    {
      "name": "Jacket for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/jacket%20for%20women2.jpg?alt=media&token=dbb12310-5660-4fdf-990c-59539ce3b86b",
      "price": "94",
      "description": "Dark gray jacket for women",
    },
    //****************T-Shirts for men************************************/
    {
      "name": "T-Shirt for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/t-shirts%20for%20men1.jpg?alt=media&token=23531546-ce47-4a9b-8bf0-ebf87bea33f2",
      "price": "92",
      "description": "White T-Shirt for men",
    },
    {
      "name": "T-Shirt for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/t-shirts%20for%20men2.jpg?alt=media&token=823f3bcf-1d06-4f08-89fc-f232eb11f380",
      "price": "93",
      "description": "Blue T-Shirt for men",
    },
//****************T-Shirts for women************************************/
    {
      "name": "T-Shirt for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/t-shirts%20for%20women1.jpg?alt=media&token=b815e353-c5eb-4b4c-abca-03b8d3cd957a",
      "price": "78",
      "description": "Black T-Shirt for women",
    },
    {
      "name": "T-Shirt for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/t-shirts%20for%20women2.jpg?alt=media&token=37e2c5b6-57f7-4340-8405-b6cb2062a5fb",
      "price": "98",
      "description": "White T-Shirt for women",
    },
    //****************Pants for men************************************/
    {
      "name": "Pants for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/Pants%20for%20men1.jpg?alt=media&token=c8787310-a393-40ba-a6de-1a7756ac4efb",
      "price": "75",
      "description": "Blue jeans pants for men",
    },
    {
      "name": "Pants for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/Pants%20for%20men2.jpg?alt=media&token=174f37f0-8cb2-47d9-a7ba-2c27a422d829",
      "price": "70",
      "description": "Light blue jeans pants for men",
    },
//****************Pants for women************************************/
    {
      "name": "Pants for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/Pants%20for%20women1.jpg?alt=media&token=33f25b15-a1de-4450-938f-0649b33b0fb7",
      "price": "81",
      "description": "Gray pants for women",
    },
    {
      "name": "Pants for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/Pants%20for%20women2.jpg?alt=media&token=4d04c6c1-fb17-48a4-8c12-689b74291c70",
      "price": "63",
      "description": "Black pants for women",
    },
    //****************Casual shoes for men************************************/
    {
      "name": "Shoes for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/casual%20shoes%20for%20men1.jpg?alt=media&token=3e7700f2-0316-4c7c-a8df-eaa7e9a89b95",
      "price": "85",
      "description": "Black casual shoes for men",
    },
    {
      "name": "Shoes for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/casual%20shoes%20for%20men2.jpg?alt=media&token=e662a6ba-a353-46c1-923a-049e21184414",
      "price": "72",
      "description": "Dark gray casual shoes for men",
    },
//****************Casual shoes for women************************************/
    {
      "name": "Shoes for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/casual%20shoes%20for%20women1.jpg?alt=media&token=bf0b7d2f-cefe-43c0-9327-77d2975d3a5b",
      "price": "98",
      "description": "White casual shoes for women",
    },
    {
      "name": "Shoes for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/casual%20shoes%20for%20women2.jpg?alt=media&token=3beedd58-6566-4204-a49d-3d7fd40566a8",
      "price": "81",
      "description": "Pink casual shoes for women",
    },
//****************Classic shoes for men************************************/
    {
      "name": "Shoes for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/classic%20shoes%20for%20men1.jpg?alt=media&token=98e850b8-59db-49df-a49b-a6b18e6a9e39",
      "price": "62",
      "description": "Black and brown classic shoes for men",
    },
    {
      "name": "Shoes for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/classic%20shoes%20for%20men2.jpg?alt=media&token=17105290-0181-439f-b026-d0a564b20ec0",
      "price": "99",
      "description": "Blue classic shoes for men",
    },
//****************Classic shoes for women************************************/
    {
      "name": "Shoes for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/classic%20shoes%20for%20women1.jpg?alt=media&token=bbf2c34e-fea2-4a61-b00c-6af938f33675",
      "price": "93",
      "description": "Brown classic shoes for women",
    },
    {
      "name": "Shoes for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/classic%20shoes%20for%20women2.jpg?alt=media&token=f5daed1d-38dd-47b0-879b-c10b554d6e23",
      "price": "67",
      "description": "Black classic shoes for women",
    },
//****************************************************/
  ];

  var suggestionsList = [
    {
      "name": "Blazer for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/blazer%20for%20men1.jpg?alt=media&token=970f9d76-3f1b-46b1-a0d9-4878cfa036e4",
      "price": "88",
      "description": "Blue blazer for men",
    },
    {
      "name": "T-Shirt for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/t-shirts%20for%20women1.jpg?alt=media&token=b815e353-c5eb-4b4c-abca-03b8d3cd957a",
      "price": "78",
      "description": "Black T-Shirt for women",
    },
    {
      "name": "Jacket for men",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/jacket%20for%20men2.jpg?alt=media&token=ff46b79a-bf98-4dc5-8ca3-9d872d332f8a",
      "price": "69",
      "description": "Blue jacket for men",
    },
    {
      "name": "Shoes for women",
      "picture":
          "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/classic%20shoes%20for%20women1.jpg?alt=media&token=bbf2c34e-fea2-4a61-b00c-6af938f33675",
      "price": "93",
      "description": "Brown classic shoes for women",
    },
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var resultList = productsList.where((p) => p.containsValue(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(resultList[index]["picture"]),
          radius: 25.0,
        ),
        title: Text(
          resultList[index]["name"],
          style: TextStyle(
            fontFamily: 'Futura PT',
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () {
          Router().navigator(
              context,
              ProductDetails(
                name: resultList[index]["name"],
                price: resultList[index]["price"],
                image: resultList[index]["picture"],
                desc: resultList[index]["description"],
              ));
        },
      ),
      itemCount: resultList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final emptyList = [];
    final list = query.isEmpty ? suggestionsList : emptyList;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(list[index]["picture"]),
          radius: 25.0,
        ),
        title: Text(
          list[index]["name"],
          style: TextStyle(
            fontFamily: 'Futura PT',
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () {
          Router().navigator(
              context,
              ProductDetails(
                name: list[index]["name"],
                price: list[index]["price"],
                image: list[index]["picture"],
                desc: list[index]["description"],
              ));
        },
      ),
      itemCount: list.length,
    );
  }
}
