import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final TextEditingController emailController =
  new TextEditingController();
  static final TextEditingController passwordController =
  new TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  Future<dynamic> onSubmit(context) async {
    //ToDo: Login b2a
    Navigator.popAndPushNamed(context, MaterialPageroute ((context)=>Homepage ());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Material(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sky.jpg'),
                    fit: BoxFit.cover)),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 10,
                        bottom: MediaQuery.of(context).size.height / 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.height / 6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                          AssetImage('assets/images/ogive_version_2.png'),
                        ),
                      ),
                    )),
//                AnimatedDefaultTextStyle(
//                  child: Text(
//                    'OGIVE',
//                  ),
//                  style: GoogleFonts.sairaCondensed(
//                    color: _color,
//                    fontSize: 80,
//                    fontWeight: FontWeight.w400,
//                    letterSpacing: 2.0,
//                  ),
//                  duration: Duration(seconds: 1),
//                  curve: ElasticInCurve(4),
//                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 1000,
                      right: 10,
                      left: 10),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: TextField(
                            controller: emailController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              icon: Icon(
                                Icons.person,
                                color: Colors.pinkAccent,
                              ),
                              labelText: 'Email',
                            ),
                          )),
                      Padding(
                          padding:
                          EdgeInsets.only(top: 20, right: 20, left: 20),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: Colors.pinkAccent,
                              ),
                              labelText: 'Password',
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              minWidth: 130,
                              child: RaisedButton(
                                child: Text('Login'),
                                color: Colors.greenAccent,
                                splashColor: Colors.blue,
                                colorBrightness: Brightness.light,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  onSubmit(context);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontSize: 13,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, 1))
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Don\'t have Account? ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "Signup");
                                },
                                child: Text(
                                  'Join Us Now!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _fullName = new TextEditingController();
  TextEditingController _userName = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  String nameError;
  String userNameError;
  String emailError;
  String passswordError;
  bool agree = false;
  bool errorAgree = false;
  @override
  void initState() {
    super.initState();
  }

  void _register() async {
    agree == false ? errorAgree = true : errorAgree = false;
    if (agree == true) {
      //ToDo: Register b2a
      // Map<String, dynamic> map = await apiCaller.create(userData: {
      //   'fullName': _fullName.value.text,
      //   'userName': _userName.value.text,
      //   'email': _email.value.text,
      //   'password': _password.value.text
      // });
      // if (map.values.elementAt(0) == 'done') {
        Navigator.popAndPushNamed(context, "Login");
      // } else if (map.values.elementAt(0) == 'undone') {
      //   nameError = map.values.elementAt(1).elementAt(0);
      //   userNameError = map.values.elementAt(1).elementAt(1);
      //   emailError = map.values.elementAt(1).elementAt(2);
      //   passswordError = map.values.elementAt(1).elementAt(3);
      // }
    }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Material(
          child: Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(radius: 1, colors: [
                Color.fromRGBO(242, 95, 76, 0.5),
                Color.fromRGBO(229, 49, 112, 0.5),
                Color.fromRGBO(15, 14, 23, 1)
              ])),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ogive_version_2.png',
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 20),
                      child: TextField(
                        controller: _fullName,
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          labelStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 216, 3, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(255, 216, 3, 1)),
                            gapPadding: 4,
                          ),
                          hintText: 'Enter your real name',
                          errorText: nameError,
//        errorBorder: OutlineInputBorder()
                        ),
                        obscureText: false,
                        keyboardType: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 20),
                      child: TextField(
                        controller: _userName,
                        decoration: InputDecoration(
                          labelText: 'User name',
                          labelStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.pink,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 216, 3, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(255, 216, 3, 1)),
                            gapPadding: 4,
                          ),
                          hintText: 'Enter the name you want to appear',
                          errorText: userNameError,
//        errorBorder: OutlineInputBorder()
                        ),
                        obscureText: false,
                        keyboardType: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 20),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.email,
                            size: 30,
                            color: Color.fromRGBO(255, 216, 3, 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Color.fromRGBO(255, 216, 3, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Color.fromRGBO(255, 216, 3, 1)),
                            gapPadding: 4,
                          ),
                          hintText: 'Enter your email',
                          errorText: emailError,
//        errorBorder: OutlineInputBorder()
                        ),
                        obscureText: false,
                        keyboardType: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 20),
                      child: TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.lock,
                            size: 30,
                            color: Color.fromRGBO(242, 95, 76, 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Color.fromRGBO(255, 216, 3, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Color.fromRGBO(255, 216, 3, 1)),
                            gapPadding: 4,
                          ),
                          hintText: 'use powerful password',
                          errorText: passswordError,
//        errorBorder: OutlineInputBorder()
                        ),
                        obscureText: true,
                        keyboardType: null,
                      ),
                    ),
                    CheckboxListTile(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value;
                        });
                      },
                      title: Text('I agree terms'),
                      controlAffinity: ListTileControlAffinity.leading,
                      subtitle: GestureDetector(
                        onTap: () {
                          //Todo: add terms to read
                        },
                        child: Text('Click here to see our terms'),
                      ),
                      secondary: Icon(Icons.book),
                    ),
                    Visibility(
                        child: Text('Why u don\'t wanna agree? ._.',
                            style: TextStyle(color: Colors.red)),
                        visible: errorAgree),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(255, 137, 6, 1),
                      onPressed: _register,
                      child: Text('Signup'),
                    )
                  ],
                ),
              )),
        ));
  }
}
