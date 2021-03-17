import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/Components/Navigator.dart';
import 'package:shopping_app/Components/Constants.dart';
import 'package:shopping_app/Components/Reuseable_Inkwell.dart';
import 'package:shopping_app/Components/FlushBar.dart';
import 'package:shopping_app/Models/Interface.dart';
import 'package:shopping_app/Screens/Home_Screen.dart';
import 'package:shopping_app/Screens/Default_Home_Screen.dart';
import 'package:shopping_app/Screens/MyAccount.dart';
import 'package:shopping_app/Screens/SignIn.dart';

class ScaffoldWithAppBar extends StatefulWidget {
  ScaffoldWithAppBar({
    this.body,
    this.iconButtonAction1,
    this.iconButtonAction2,
    this.icon1,
    this.icon2,
    this.floatingActionButton,
    this.drawer,
  });

  final Widget body;
  final Function iconButtonAction1;
  final Function iconButtonAction2;
  final Icon icon1;
  final Icon icon2;
  final Widget floatingActionButton;
  final bool drawer;
  @override
  _ScaffoldWithAppBarState createState() => _ScaffoldWithAppBarState(
        scaffoldBody: body,
        appBarIconButtonAction1: iconButtonAction1,
        appBarIconButtonAction2: iconButtonAction2,
        appBarIcon1: icon1,
        appBarIcon2: icon2,
        bodyFloatingActionButton: floatingActionButton,
        bodyDrawer: drawer,
      );
}

class _ScaffoldWithAppBarState extends State<ScaffoldWithAppBar>
    with Interface {
  _ScaffoldWithAppBarState({
    this.scaffoldBody,
    this.appBarIconButtonAction1,
    this.appBarIconButtonAction2,
    this.appBarIcon1,
    this.appBarIcon2,
    this.bodyFloatingActionButton,
    this.bodyDrawer,
  });
  //Constructor variables.
  final Widget scaffoldBody;
  final Function appBarIconButtonAction1;
  final Function appBarIconButtonAction2;
  final Icon appBarIcon1;
  final Icon appBarIcon2;
  final Widget bodyFloatingActionButton;
  final bool bodyDrawer;

  //Variables.
  final _auth = FirebaseAuth.instance;
  final fireStore = Firestore.instance;
  DocumentReference doc;
  FirebaseUser newUser;
  String currentuser = '';
  String currentuserEmail = '';
  String url =
      "https://firebasestorage.googleapis.com/v0/b/shopping-app-d5f2a.appspot.com/o/NoUser.jpg?alt=media&token=c987fbb1-f8d2-4a3f-b096-bbf74e405576";

  @override
  void initState() {
    getUser();
    super.initState();
  }

  //Method 'getUser' to get the current signed in  user from firebase and retrive user's email, user name , bio and picture
  void getUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        newUser = user;
        setState(() {
          currentuserEmail = newUser.email;
        });

        final doc = await fireStore
            .collection('users')
            .document(currentuserEmail)
            .get();
        String loggedUserName = doc['username'];
        String imageUrl = doc['picture'];
        setState(() {
          currentuser = loggedUserName;
          url = imageUrl;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          'Shop It',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: KPrimaryBrightColor,
          ),
        ),
        actions: [
          IconButton(
            icon: appBarIcon1,
            onPressed: appBarIconButtonAction1,
            iconSize: 35,
          ),
          IconButton(
            icon: appBarIcon2,
            onPressed: appBarIconButtonAction2,
            iconSize: 35,
          ),
        ],
        iconTheme: IconThemeData(
          color: KPrimaryBrightColor,
        ),
      ),
      body: scaffoldBody,
      floatingActionButton: bodyFloatingActionButton,
      drawer: bodyDrawer
          ? Drawer(
              child: Container(
                width: 50,
                color: Color(0xffffffff),
                child: new ListView(
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                      //Data goes here
                      accountName: Text(
                        currentuser,
                        style: TextStyle(
                          fontFamily: 'Futura PT',
                          fontSize: 20,
                          color: KPrimaryBrightColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      accountEmail: Text(
                        currentuserEmail,
                        style: TextStyle(
                          fontFamily: 'Futura PT',
                          fontSize: 20,
                          color: KPrimaryBrightColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      currentAccountPicture: GestureDetector(
                        child: new CircleAvatar(
                          backgroundImage: NetworkImage(url),
                        ),
                      ),

                      //Box holding first section (User Data)
                      decoration: KDrawerBoxDecoration,
                    ),

                    //Drawer Body
                    //Home
                    ReuseableInkwell(
                      inkTitle: 'Home',
                      icon: Icons.home,
                      iconColor: KPrimaryDarkColor,
                      onPress: () {
                        Router().navigator(context, Home());
                      },
                    ),

                    //My account
                    ReuseableInkwell(
                      inkTitle: 'My account',
                      icon: Icons.person,
                      iconColor: KPrimaryDarkColor,
                      onPress: () {
                        Router().navigator(
                            context,
                            Myaccount(
                              email: currentuserEmail,
                              user: currentuser,
                              picture: url,
                            ));
                      },
                    ),

                    //Log out.
                    ReuseableInkwell(
                      inkTitle: 'Log out',
                      icon: Icons.exit_to_app,
                      onPress: () => action(context),
                      iconColor: KPrimaryDarkColor,
                    ),
                  ],
                ),
              ),
            )
          : Drawer(
              child: Container(
                width: 50,
                color: Color(0xffffffff),
                child: new ListView(
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                      //Data goes here
                      accountName: Text(
                        'Shop It',
                        style: TextStyle(
                          fontFamily: 'Futura PT',
                          fontSize: 20,
                          color: KPrimaryBrightColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      accountEmail: Text(
                        'Welcome to Shop It',
                        style: TextStyle(
                          fontFamily: 'Futura PT',
                          fontSize: 20,
                          color: KPrimaryBrightColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      currentAccountPicture: GestureDetector(
                        child: new CircleAvatar(
                          backgroundImage: AssetImage("images/cart (1).png"),
                        ),
                      ),

                      //Box holding first section (User Data)
                      decoration: KDrawerBoxDecoration,
                    ),

                    //Drawer Body
                    //Home
                    ReuseableInkwell(
                      inkTitle: 'Home',
                      icon: Icons.home,
                      iconColor: KPrimaryDarkColor,
                      onPress: () {
                        Router().navigator(context, DefaultHome());
                      },
                    ),

                    //Log out.
                    ReuseableInkwell(
                      inkTitle: 'Sign In',
                      icon: FontAwesomeIcons.signInAlt,
                      onPress: () {
                        Router().navigator(context, SignIn());
                      },
                      iconColor: KPrimaryDarkColor,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void action(BuildContext context) async {
    //Check if there is internet connection or not and display message error if not.
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Warning().errorMessage(context,
          title: "No internet connection !",
          message: "Pleas turn on wifi or mobile data",
          icons: Icons.signal_wifi_off);
    } else {
      _auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('email');
      Router().navigator(context, DefaultHome());
    }
  }
}
