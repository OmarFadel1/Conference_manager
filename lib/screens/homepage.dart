import 'package:buy_it/constants.dart';
import 'package:buy_it/screens/edit_data.dart';
import 'package:buy_it/screens/mershandise_categories_screen.dart';
import 'package:buy_it/screens/rooming_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'admin/adddelegate.dart';
import 'login_screen.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabBarindex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: KMaiinColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Mersh.id);
                  },
                  child: Text(
                    'Mershandise',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoomingList.id);
                  },
                  child: Text(
                    'Search Delegate',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EditPage.id);
                  },
                  child: Text(
                    'Rooming List',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Adddelegate.id);
                  },
                  child: Text(
                    'Add delegate',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, HomePage.id);

                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Sign out',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
        Material(
          color: KMaiinColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Strike'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.sports_golf,
                      size: 50,
                    )
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
