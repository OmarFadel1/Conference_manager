import 'package:buy_it/models/Delegate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class RoomingList extends StatefulWidget {
  static String id = 'RoominList';

  @override
  State<RoomingList> createState() => _RoomingListState();
}

class _RoomingListState extends State<RoomingList> {
  List searchResult = [];
  void searchfromfirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('LC', isEqualTo: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Delegates'),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            cursorColor: KMaiinColor,
            decoration: InputDecoration(
                hintText: 'Enter LC',
                prefixIcon: Icon(
                  Icons.person,
                  color: KMaiinColor,
                ),
                filled: true,
                fillColor: KSecondaryColor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white))),
            onChanged: (query) {
              searchfromfirebase(query);
            },
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: searchResult.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(searchResult[index]['name']),
                subtitle: Text('Room number : ' +
                    searchResult[index]['room'].toString() +
                    ', LC : ' +
                    searchResult[index]['LC']));
          },
        ))
      ]),
    );
  }
}
