import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../dashboard/student_dashboard.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<bool> _isSelected = List.generate(2, (_) => false);
  List<Color> _changeColor = [Color(0xFFB6BE878), Color(0x66B6BE878)];
  String _firstText = "USN";
  int _charlength = 10;
  // final usnController = TextEditingController();
  // final emailController = TextEditingController();
  GlobalKey<FormState> _signIn = new GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double blockWidth = width / 100;
    double blockHeight = height / 100;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _signIn,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: blockHeight * 22.0, left: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(fontSize: 28.0),
                          ),
                          Text(
                            "Welcome !",
                            style: TextStyle(fontSize: 28.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 150.0, left: 5.0),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/signUp.svg',
                        width: 200,
                        height: 170,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 5, 30, 10),
                child: TextFormField(
                  validator: (usn) =>
                      usn.length == 0 ? "please enter" : null,
                  maxLength: _charlength,
                  decoration: InputDecoration(labelText: _firstText),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  )),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 25),
                height: 42.0,
                child: ToggleButtons(
                  isSelected: _isSelected,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 165.0,
                      color: _changeColor[0],
                      child: Text('Student',
                          style: TextStyle(
                              color: Color(0xFFBFFFFFF), fontSize: 20.0)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 165.0,
                      color: _changeColor[1],
                      child: Text(
                        'Teacher',
                        style: TextStyle(
                            color: Color(0xFFBFFFFFF), fontSize: 20.0),
                      ),
                    ),
                  ],
                  borderColor: Color(0xFFB6BE878),
                  onPressed: (index) {
                    setState(() {
                      if (index == 0) {
                        _firstText = "USN";
                        _charlength = 10;
                        _changeColor[0] = Color(0xFFB6BE878);
                        _changeColor[1] = Color(0x66B6BE878);
                      } else {
                        _firstText = "Email";
                        _charlength = null;
                        _changeColor[1] = Color(0xFFB6BE878);
                        _changeColor[0] = Color(0x66B6BE878);
                      }
                      _isSelected = List.generate(_isSelected.length, (idx) {
                        if (index == idx) return true;
                        return false;
                      });
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 28.0),
                alignment: Alignment.centerLeft,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  // style: OutlinedButton.styleFrom(primary: Colors.deepPurpleAccent),
                  padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentDashboard()));
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
            ],
          ),
        ),
      ),
    );
  }
}
