import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> signup(String email, String password) async {
    const url = 'https://someURL'; // add the url to the users service

    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );
    // print the token after a singup
    print(json.decode(response.body));
  }

  Future<void> login(String username, String password) async {
    final uri = Uri.parse('http://localhost:9003/login');

    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;

    final response = await http.post(
        uri,
        body: map,
    );
    String? accessToken = response.headers["accesstoken"];
    print("called from provider");
    print(accessToken);
  }
}