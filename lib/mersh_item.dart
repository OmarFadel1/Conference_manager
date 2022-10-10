import 'package:buy_it/constants.dart';
import 'package:buy_it/screens/category_mershandise_screen.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MershItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  MershItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMershandiseScreen.id,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
