import 'package:buy_it/screens/admin/adddelegate.dart';
import 'package:buy_it/screens/admin/admintrackorder.dart';
import 'package:buy_it/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/constants.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, SoldMersh.id);
              },
              child: Text(
                'Track orders',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            height: 70,
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context, AdminHome.id);
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Text(
                'Sign out',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
