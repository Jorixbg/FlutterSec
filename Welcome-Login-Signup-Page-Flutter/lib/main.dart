import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Content_Grid/content_grid.dart';
import 'package:flutter_auth/Screens/Users/users_list_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/providers/auth.dart';
import 'package:flutter_auth/providers/users.dart';
import 'package:provider/provider.dart';

import 'Screens/Content_Grid/categories_comic_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (context) => Auth()),
        ChangeNotifierProxyProvider<Auth, Users>(
            create: (context) => Users('', []),
            update: (ctx, auth, previousUsers) => Users(
              auth.token!,
              previousUsers == null ? [] : previousUsers.users
            ),
        )
      ],
      child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Auth',
              theme: ThemeData(
                  primaryColor: kPrimaryColor,
                  scaffoldBackgroundColor: Colors.white,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kPrimaryColor,
                      shape: const StadiumBorder(),
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    iconColor: kPrimaryColor,
                    prefixIconColor: kPrimaryColor,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                  )),
              home: auth.isAuth ? ContentGridScreen() : WelcomeScreen(),
              routes: {
                CategoryComicsScreen.routeName: (ctx) => CategoryComicsScreen(),
                UsersListScreen.routeName: (ctx) => UsersListScreen(),
              },
            )
      )
    );
  }
}
