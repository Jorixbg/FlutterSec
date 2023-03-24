import 'package:flutter/material.dart';

import '../Screens/Content_Grid/categories_comic_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgrColor;

  CategoryItem(this.id, this.title, this.bgrColor);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryComicsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  bgrColor.withOpacity(0.7),
                  bgrColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        )
    );
  }
}