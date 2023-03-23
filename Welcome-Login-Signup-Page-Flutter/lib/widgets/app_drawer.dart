
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Users/users_list_screen.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/users.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Auth>(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello: ${providerData.userId}'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('JWT Valid until: ${providerData.expiryDate}'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('See All users'),
            onTap: () {
                Provider.of<Users>(context, listen: false).fetchUsers()
                    .onError((error, stackTrace) => _showErrorDialog(
                        context,'error in communication or you are not ADMIN'
                    )
                );
                Navigator.of(context).pushNamed(
                  UsersListScreen.routeName,
                );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
  void _showErrorDialog(BuildContext context, String message) {
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

}