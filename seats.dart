import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class seats extends StatelessWidget {
  @override
  final int str;
  seats(this.str);
  var a = Color.fromRGBO(218, 223, 225, 1);
  Function change_Color(a) {
    if (a == Color.fromRGBO(218, 223, 225, 1)) a = Colors.green;
  }

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 40,
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    change_Color(a);
                  });
                },
                disabledColor: Color.fromRGBO(125, 125, 125, .9),
                color: a,
                shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.fromLTRB(2, 3, 2, 3),
                child: Text(
                  str.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void setState(Null Function() param0) {}
}
