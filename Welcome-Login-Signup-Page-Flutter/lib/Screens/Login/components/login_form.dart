import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../providers/auth.dart';
import '../../Signup/signup_screen.dart';


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

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

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
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Invalid username/email!';
                }
              },
              onSaved: (String? value) {
                _authData['email'] = value!;
              },
              decoration: const InputDecoration(
                hintText: "Your username/email",
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
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is too short!';
                  }
                },
                onSaved: (String? value) {
                  _authData['password'] = value!;
                },
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
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
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

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    // extract the data from the form fields
    _formKey.currentState!.save();

    try {
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email']!,
        _authData['password']!,
      ).then((value) => Navigator.pop(context));
    } catch (error) {
      var errorMessage = 'Authentication failed';
      _showErrorDialog(errorMessage);
    }

  }
}