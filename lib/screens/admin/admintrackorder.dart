import 'package:buy_it/models/sold_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SoldMersh extends StatelessWidget {
  static String id = 'AdminTrack';

  final Stream<QuerySnapshot> sold =
      FirebaseFirestore.instance.collection('sold').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sold Mershandise')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sold Mershandise',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Container(
              height: 700,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                  stream: sold,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading..');
                    }
                    final data = snapshot.requireData;
                    return Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                                child: Text('${data.docs[index]['quantity']}')),
                            title: Text('${data.docs[index]['name']}'),
                            subtitle:
                                Text('sold by: ${data.docs[index]['soldby']}'),
                          );
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
