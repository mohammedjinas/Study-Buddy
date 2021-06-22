import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybudy/screens/authentication/sign_in.dart';
import 'package:studybudy/screens/authentication/sign_up.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.fromLTRB(30, 150, 30, 30),
          child: SvgPicture.asset(
            'assets/images/welcomepage.svg',
            width: 200,
            height: 170,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Welcome to Study Buddy",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 10.0),
          padding: EdgeInsets.all(40.0),
          alignment: Alignment.center,
          child: Text(
            "Access your courses on the go with the Study buddy mobile app!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          // ignore: deprecated_member_use
          child: RaisedButton(
            // style: OutlinedButton.styleFrom(primary: Colors.deepPurpleAccent),
            padding: EdgeInsets.fromLTRB(110, 15, 110, 15),
            color: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
