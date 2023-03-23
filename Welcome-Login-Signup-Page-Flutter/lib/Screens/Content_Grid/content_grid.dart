import 'package:flutter/material.dart';
import 'package:flutter_auth/dummy_data%20.dart';
import 'package:flutter_auth/widgets/background.dart';

import '../../widgets/app_drawer.dart';
import '../../widgets/category-item.dart';

class ContentGridScreen extends StatelessWidget {
  const ContentGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(child:
    Scaffold(
      appBar: AppBar(title: Text('Choose from'),),
      drawer: AppDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id, e.title, e.color)).toList(),
      ),
    ),
    );
  }
}