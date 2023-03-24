import 'package:flutter/material.dart';
import 'package:flutter_auth/providers/users.dart';
import 'package:provider/provider.dart';

class UsersListScreen extends StatelessWidget {
  static const routeName = 'users-list';

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    final usersList = Provider.of<Users>(context).users;
    return Consumer(
        builder: (context, usrs, _) =>  Scaffold(
          appBar: AppBar(
            title: Text('Registered users'),
          ),
          body: ListView.builder(
            itemBuilder: (ctx, index) {
              return
                Text('userId: ${usersList[index].id}  ' +
                    'username: ${usersList[index].username}   ' +
                    'name: ${usersList[index].name}   ');
            },
            itemCount: usersList.length,
          ),
        )
    );
  }
}