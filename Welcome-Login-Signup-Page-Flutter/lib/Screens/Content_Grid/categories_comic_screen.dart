
import 'package:flutter/material.dart';
import 'package:flutter_auth/dummy_data%20.dart';

import '../../widgets/comics-item.dart';

class CategoryComicsScreen extends StatelessWidget {
  static const routeName = 'category-comics';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryComics = DUMMY_COMICS.where((comic) {
      return comic.categories.contains(categoryId);
    }).toList();
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Try these from:' + categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {

            return
              ComicsItem(
                id: categoryComics[index].id,
                title: categoryComics[index].title,
                imageUrl: categoryComics[index].imageUrl,
                chapter: categoryComics[index].chapter,
                categories: categoryComics[index].categories);
          },
          itemCount: categoryComics.length,
        ),
      );

  }
}