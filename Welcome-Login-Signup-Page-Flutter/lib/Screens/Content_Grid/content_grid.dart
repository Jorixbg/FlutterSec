import 'package:flutter/material.dart';

class ContentGridScreen extends StatefulWidget{
  @override
  _ContentGridScreenState createState() => _ContentGridScreenState();
}
// {
//
//   @override
//   Widget build(BuildContext context) {
//     const title = 'List of Comics';
//     print("notifier called",);
//     return MaterialApp(
//       title: title,
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(title),
//         ),
//         body: GridView.count(
//           // Create a grid with 2 columns. If you change the scrollDirection to
//           // horizontal, this produces 2 rows.
//           crossAxisCount: 2,
//           // Generate 100 widgets that display their index in the List.
//           children: List.generate(100, (index) {
//             return Center(
//               child: Text(
//                 'Item $index',
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
class _ContentGridScreenState extends State<ContentGridScreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'List of Comics';
    print("notifier called",);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your comics'),
        )
    );
    // return MaterialApp(
    //   title: title,
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text(title),
    //     ),
    //     body: GridView.count(
    //       // Create a grid with 2 columns. If you change the scrollDirection to
    //       // horizontal, this produces 2 rows.
    //       crossAxisCount: 2,
    //       // Generate 100 widgets that display their index in the List.
    //       children: List.generate(100, (index) {
    //         return Center(
    //           child: Text(
    //             'Item $index',
    //             style: Theme.of(context).textTheme.headline5,
    //           ),
    //         );
    //       }),
    //     ),
    //   ),
    // );
  }
}