import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/Screens/Default_Home_Screen.dart';
import 'package:shopping_app/Screens/Home_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: email == null ? DefaultHome() : Home()),
  );
}


