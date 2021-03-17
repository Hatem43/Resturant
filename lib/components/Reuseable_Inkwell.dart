import 'package:flutter/material.dart';
import 'package:shopping_app/Components/Constants.dart';

class ReuseableInkwell extends StatelessWidget {
  ReuseableInkwell({this.inkTitle, this.onPress, this.icon, this.iconColor});

  final String inkTitle;
  final Function onPress;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: ListTile(
        title: Text(
          inkTitle,
          style: TextStyle(
            fontFamily: 'Futura PT',
            fontSize: 20,
            color: KPrimaryDarkColor,
          ),
        ),
        leading: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}
