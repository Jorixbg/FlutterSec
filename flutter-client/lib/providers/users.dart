import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Users with ChangeNotifier {
  static const getUsersRoute = 'http://localhost:9003/users/';

  List<User> _users = [];

  late final String authToken;

  Users(this.authToken, this._users);

  List<User> get users {
    return [..._users];
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse(getUsersRoute),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
        }
      );
      if (response.statusCode == 403) throw Error();
      var data = json.decode(response.body) as List;
      List<User> rcvUsers = <User>[];

      for (var e in data) {
        var tMap = e as Map<String, dynamic>;
        rcvUsers.add(
            User(id: tMap['id'].toString(),
                name: tMap['name'].toString(),
                username: tMap['username'].toString())
        );
      }
      _users = rcvUsers;
      notifyListeners();
    }
    catch (error) {
      throw HttpException('you are not admin');
    }
  }
}