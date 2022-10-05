import 'package:buy_it/models/sold_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SoldMersh extends StatelessWidget {
  static String id = 'AdminTrack';

  final Stream<QuerySnapshot> sold =
      FirebaseFirestore.instance.collection('sold').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sold Mershandise')),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: StreamBuilder<QuerySnapshot>(
              stream: sold,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading..');
                }
                final data = snapshot.requireData;
                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          child: Text('${data.docs[index]['quantity']}')),
                      title: Text('${data.docs[index]['name']}'),
                      subtitle: Text('sold by: ${data.docs[index]['soldby']}'),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
