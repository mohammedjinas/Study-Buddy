import 'package:flutter/material.dart';

class SignUpTextFields extends StatelessWidget {
  final String inputText;
  final TextEditingController controller;
  final bool isPassword;
  final TextEditingController pass;

  SignUpTextFields({
    @required this.inputText,
    @required this.controller,
    this.isPassword = false,
    this.pass,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.86,
        height: 45.0,
        child: TextFormField(
          controller: this.controller,
          validator: (value) {
            if (value.isEmpty) {
              return "Required";
            }
            if (this.isPassword && this.pass != null) {
              if (this.controller.text != this.pass.text) {
                return "Passwords dont match";
              }
            }
            return null;
          },
          cursorColor: Colors.grey,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          obscureText: isPassword ? true : false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              ),
            ),
            alignLabelWithHint: true,
            labelText: inputText,
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[400]),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }
}
