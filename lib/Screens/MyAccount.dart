import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/Components/ScaffoldWithAppBar.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Components/Navigator.dart';
import 'package:shopping_app/Components/SizeConfig.dart';
import 'package:shopping_app/Models/Search_Model.dart';
import 'package:shopping_app/Screens/ImageSelection.dart';
import 'package:shopping_app/Screens/Shopping_Cart.dart';

class Myaccount extends StatefulWidget {
  Myaccount({
    this.user,
    this.picture,
    this.email,
  });
  final String user;
  final String picture;
  final String email;
  @override
  _MyaccountState createState() => _MyaccountState(
        user: user,
        picture: picture,
        email: email,
      );
}

class _MyaccountState extends State<Myaccount> {
  _MyaccountState({
    this.user,
    this.picture,
    this.email,
  });
  final String user;
  final String picture;
  final String email;

  //variable '_image' to hold selected image.
  File _image;

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
        icon2: Icon(Icons.shopping_cart),
        iconButtonAction2: () => Router().navigator(context, Cart()),
        drawer: true,
        body: Stack(
          children: [
            //Image holder container.
            Container(
              height: SizeConfig.defaultSize * 20,
              margin: EdgeInsets.all(SizeConfig.defaultSize - 5),
              decoration: BoxDecoration(
                color: KPrimaryBrightColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),

            //Image container.
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.defaultSize * 9.5,
                left: SizeConfig.defaultSize * 13,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: KPrimaryDarkColor,
                  width: SizeConfig.defaultSize - 5,
                ),
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                child: new CircleAvatar(
                    radius: 70, backgroundImage: NetworkImage(picture)),
              ),
            ),

            //Change image button container.
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.defaultSize * 19.5,
                  left: SizeConfig.defaultSize * 23),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: ButtonTheme(
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      size: 30.0,
                      color: KPrimaryDarkColor,
                    ),
                    onPressed: chooseFile),
              ),
            ),

            //Username container.
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.defaultSize * 16),
              child: Center(
                child: Text(
                  user,
                  style: TextStyle(
                    fontFamily: 'Futura PT',
                    fontSize: 28,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            //Email label container.
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.defaultSize * 35,
                  left: SizeConfig.defaultSize),
              child: Text(
                'Email:',
                style: TextStyle(
                  fontFamily: 'Futura PT',
                  fontSize: 25,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            //Email Content container.
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.defaultSize * 35.3,
                  left: SizeConfig.defaultSize * 9),
              child: Text(
                email,
                style: TextStyle(
                  fontFamily: 'Futura PT',
                  fontSize: 21,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  ///**************************BACK END*******************************
  // ignore: missing_return
  Future<bool> _onWillPop() {
    SystemNavigator.pop();
  }

  //Method 'chooseFile' to make the user choose photo from device's gallary.
  Future chooseFile() async {
    // ignore: deprecated_member_use
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
    Router().navigator(
      context,
      Selection(
        picture: _image,
      ),
    );
  }
}
