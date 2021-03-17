import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Components/FlushBar.dart';
import 'package:shopping_app/Components/SizeConfig.dart';

class Selection extends StatefulWidget {
  Selection({this.picture});
  final File picture;

  @override
  SelectionState createState() => SelectionState(picture: picture);
}

class SelectionState extends State<Selection> {
  SelectionState({this.picture});
  final File picture;
  final _auth = FirebaseAuth.instance;
  FirebaseUser newUser;
  final fireStore = Firestore.instance;
  String id;
  var uploadedImageUrl;
  DocumentReference roomDoc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              //Container to hold 'Selected image' label.
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.defaultSize + 45,
                    bottom: SizeConfig.defaultSize),
                child: Text(
                  'Selected image',
                  style: TextStyle(
                    fontFamily: 'Futura PT',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              picture != null
                  ? Image.file(
                      picture,
                      height: 150,
                    )
                  //Empty container to display if no image was selected.
                  : Container(height: SizeConfig.defaultSize * 15),
              //Container to hold 'Upload image' button.
              Container(
                margin: EdgeInsets.only(top: SizeConfig.defaultSize),
                child: ButtonTheme(
                  minWidth: SizeConfig.defaultSize * 8.5,
                  height: SizeConfig.defaultSize * 3,
                  child: RaisedButton(
                    onPressed: picture != null ? upload : null,
                    child: Text(
                      'Upload image',
                      style: TextStyle(
                        fontFamily: 'Futura PT',
                        fontSize: 18,
                        color: KPrimaryBrightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: KPrimaryDarkColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future upload() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Warning().errorMessage(context,
          title: "No internet connection !",
          message: "Pleas turn on wifi or mobile data",
          icons: Icons.signal_wifi_off);
    } else {
      String fileName = Path.basename(picture.path);
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = storageReference.putFile(picture);
      await uploadTask.onComplete;
      uploadedImageUrl = await storageReference.getDownloadURL() as String;
      try {
        //getting logged user name from Shared Preferences.
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var loggedInUserEmail = prefs.getString('email');

        final user = await _auth.currentUser();
        if (user != null) {
          await fireStore
              .collection('users')
              .document(loggedInUserEmail)
              .updateData({
            'picture': uploadedImageUrl,
          });
        }
        Warning().errorMessage(context,
            title: "Profile picture changed !",
            message: "Uploaded successfully",
            icons: Icons.done);
      } catch (e) {
        Warning().errorMessage(context,
            title: "Something went wrong !",
            message: "Try again later",
            icons: Icons.error);
        print(e.toString());
      }
    }
  }
}
