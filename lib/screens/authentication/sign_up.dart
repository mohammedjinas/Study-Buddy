import 'package:flutter/material.dart';
import 'package:studybudy/common_widget/sign_up_textfields.dart';
import 'package:studybudy/screens/dashboard/student_dashboard.dart';
import 'package:studybudy/services/auth_services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthService authService;

  final _registerController = GlobalKey<FormState>();

  final _firstName = TextEditingController();

  final _lastName = TextEditingController();

  final _usn = TextEditingController();

  final _phoneNo = TextEditingController();

  final _email = TextEditingController();

  final _password = TextEditingController();

  final _confirmPassword = TextEditingController();
  final snackBar = SnackBar(content: Text('Already registered'));

  @override
  void initState() {
    super.initState();
    authService = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _registerController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 45.0,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        controller: _firstName,
                        cursorColor: Colors.grey,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0))),
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 45.0,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        controller: _lastName,
                        textAlign: TextAlign.center,
                        autocorrect: false,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0))),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SignUpTextFields(inputText: "U.S.N", controller: _usn),
              SignUpTextFields(inputText: "Phone Number", controller: _phoneNo),
              SignUpTextFields(inputText: "Email", controller: _email),
              SignUpTextFields(
                inputText: "Password",
                controller: _password,
                isPassword: true,
              ),
              SignUpTextFields(
                inputText: "Confirm Password",
                controller: _confirmPassword,
                isPassword: true,
                pass: _password,
              ),
              Container(
                width: 160.0,
                height: 70.0,
                padding: EdgeInsets.only(top: 25.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.lightBlue[400],
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_registerController.currentState.validate()) {
                      String userName = _firstName.text + " " + _lastName.text;

                      authService
                          .registerUser(
                              username: userName,
                              email: _email.text,
                              password: _password.text,
                              phoneNo: int.parse(_phoneNo.text),
                              usn: _usn.text,
                              isStudent: true)
                          .then((response) {
                        if (response == 201) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentDashboard(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
