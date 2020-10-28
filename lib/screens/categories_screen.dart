import 'package:flutter/material.dart';
import 'package:flutter_app/dummy_data.dart';
import 'package:flutter_app/module/Category.dart';
import 'package:flutter_app/dummy_data.dart';
import 'package:flutter_app/widgets/category_idm.dart';

class Categoriesscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView(
        children: DUMMY_CATEGORIES.map((catData) =>
        Categoryitem(id:catData.id,title: catData.title,color: catData.color),
        ).toList(), //this will convert list of objects into list of widgets
          padding: EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
      ),
    );
  }
}

