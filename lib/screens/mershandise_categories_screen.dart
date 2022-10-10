import 'package:buy_it/mersh_item.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/dummy_data.dart';
import 'package:flutter/cupertino.dart';

class Mersh extends StatelessWidget {
  static String id = 'MershPage';
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge:
                  TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
              titleMedium:
                  TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
              titleSmall:
                  TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
            ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mershandise'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  MershItem(catData.id, catData.title, catData.color))
              .toList(),
        ),
      ),
    );
  }
}
