import 'dart:async';
import 'dart:convert';
import 'package:flutter_auth/model/User.dart';
import 'package:http/http.dart' as http;


class AuthRepository {
  String baseUrl = 'http://localhost:8080/auth/';
  String login(User user)  {
    final response = http.post(
      Uri.parse(baseUrl + 'login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': user.username, 'password': user.password}),
    );
      return 'pene';

  }

  bool isSignedIn()  {
    return true;
  }
  User getUserFromToken() {
    return new User('james', 'Askdjaskjdbn2!');
  }
}