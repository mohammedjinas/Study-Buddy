import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class AuthService {
  final String url = "http://10.0.2.2:8000/api/";

  Future<int> registerUser(
      {@required String username,
      @required String email,
      @required String password,
      @required int phoneNo,
      @required String usn,
      @required bool isStudent}) async {
    Uri uri = Uri.parse(url + "register/");
    Map<String, String> headers = {
      "Content-type": "application/json; charset=utf-8"
    };
    Map<String, dynamic> json = {
      "username": username,
      "email": email,
      "password": password,
      "phone_number": phoneNo,
      "usn": usn,
      "is_student": isStudent,
    };
    String requestBody = jsonEncode(json);
    Response response = await post(uri, headers: headers, body: requestBody);
    return response.statusCode;
  }
}
