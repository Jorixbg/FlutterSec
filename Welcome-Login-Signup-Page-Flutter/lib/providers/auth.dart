import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class Auth extends ChangeNotifier {
  late String _token;
  DateTime? _expiryDate;
  String? _userId;
  List<dynamic>? _roles;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null
        && _expiryDate!.isAfter(DateTime.now())
        && _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> login(String username, String password) async {
    final uri = Uri.parse('http://localhost:9003/login');

    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;

    try {
      final response = await http.post(
        uri,
        body: map,
      );
      String? accessToken = response.headers["accesstoken"];
      print("called from provider");
      print(accessToken);

      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
      print(decodedToken);
      _roles = decodedToken['roles'];
      _expiryDate = DateTime.now().add(Duration(seconds: decodedToken['exp'],),);
      _token = accessToken;
      print(isAuth);
      notifyListeners();
    }
    catch (error) {
      rethrow;
    }
  }

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
    String receivedAuthData = json.decode(response.body);
  }
}