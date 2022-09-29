import 'package:buy_it/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

class CategoryMershandiseScreen extends StatelessWidget {
  static String id = 'CategoryMershandiseScreen';
  // final String CategoryId;
  // final String CategoryTitle;
  // CategoryMershandiseScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMersh = DUMMY_PRODUCTS.where(
      (product) {
        return product.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ProductItem(
            id: categoryMersh[index].id,
            title: categoryMersh[index].title,
            imageUrl: categoryMersh[index].imageUrl,
            price: categoryMersh[index].price,
          );
        },
        itemCount: categoryMersh.length,
      ),
    );
  }
}
