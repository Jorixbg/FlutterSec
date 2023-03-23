
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComicsItem extends StatelessWidget {
  final String id;
  final int chapter;
  final List<String> categories;
  final String title;
  final String imageUrl;

  const ComicsItem({
    required this.id,
    required this.chapter,
    required this.categories,
    required this.title,
    required this.imageUrl
});

  void selectMeal(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   MealDetailScreen.routeName,
    //   arguments: id,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
            ),
              child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover
              ),
            ),
            Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                )
            )
          ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.schedule),
                  SizedBox(width: 6,),
                  Text('duration: ' + '15mins'),
                ],),
                Row(children: <Widget>[
                  Icon(Icons.schedule),
                  SizedBox(width: 6,),
                  Text('chapter: ' + '${chapter}'),
                ],),

              ],
            ),)
        ],),
      ),
    );
  }

}