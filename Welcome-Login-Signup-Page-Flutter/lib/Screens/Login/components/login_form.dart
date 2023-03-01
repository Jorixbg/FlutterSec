import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../providers/auth.dart';
import '../../Content_Grid/content_grid.dart';
import '../../Signup/signup_screen.dart';

import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}
// Define a corresponding State class.
// This class holds the data related to the Form.
class _LoginFormState extends State<LoginForm> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

      return Form(
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () {
                  print('attempting login');
                  //login(userNameController.text, passwordController.text);
                  Provider.of<Auth>(context, listen: false).login(userNameController.text, passwordController.text);
                  // if (userNameController.text == "admin" && passwordController.text == "admin") {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) {
                  //         return  ContentGrid();
                  //       },
                  //     ),
                  //   );
                  // } else {
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return const AlertDialog(
                  //         content: Text(
                  //             "I am sorry wrong password or username"),
                  //       );
                  //     },
                  //   );
                  // }
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      );

  }

  Future<String> login(String username, String password) async {

    final uri = Uri.parse('http://localhost:9003/login');
    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;

    Response response = await http.post(
      uri,
      body: map
    );

    int statusCode = response.statusCode;
    String? accessToken = response.headers["accesstoken"];
    String? responsebody = response.body;
    //JWT.decode(accessToken);
    // Set JWT in session
    print(statusCode);
    print(accessToken);
    print(responsebody);

    return "";
  }
}