import 'package:flutter/material.dart';
import 'package:shopping_app/Components/Constants.dart';

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  Textfield(
      {@required this.label,
      @required this.hint,
      this.icon,
      this.hideText,
      @required this.controller,
      this.email,
      this.focusNode,
      this.maxLines}) {
    if (email) {
      type = TextInputType.emailAddress;
      length = 35;
    } else {
      type = TextInputType.text;
      length = 200;
    }
  }

  final String label;
  final String hint;
  final IconData icon;
  final bool hideText;
  final TextEditingController controller;
  final bool email;
  var type;
  int length;
  var focusNode;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          color: KPrimaryBrightColor,
        ),
        decoration: new InputDecoration(
          fillColor: KPrimaryBrightColor,
          counter: Offstage(),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(40),
            ),
            borderSide: const BorderSide(
              color: KSubDarkColor,
            ),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(40),
            ),
            borderSide: const BorderSide(
              color: KSubDarkColor,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 15,
            color: KPrimaryBrightColor,
          ),
          icon: Icon(
            icon,
            color: KPrimaryBrightColor,
            size: 30,
          ),
        ),
        keyboardType: type,
        cursorColor: KPrimaryBrightColor,
        obscureText: hideText,
        controller: controller,
        maxLength: length,
        maxLengthEnforced: true,
        focusNode: focusNode,
      ),
    );
  }
}
