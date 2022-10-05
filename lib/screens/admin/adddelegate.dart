import 'dart:convert';

import 'package:buy_it/constants.dart';
import 'package:buy_it/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/models/Delegate.dart';

class Adddelegate extends StatefulWidget {
  static String id = 'AddDelegate';

  @override
  State<Adddelegate> createState() => _AdddelegateState();
}

class _AdddelegateState extends State<Adddelegate> {
  final controllerName = TextEditingController();

  final controllerLC = TextEditingController();

  final controllerRoom = TextEditingController();

  bool _validatename = false;

  bool _validateroom = false;

  bool _validateLC = false;

  void clearText() {
    controllerLC.clear();
    controllerName.clear();
    controllerRoom.clear();
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMaiinColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: controllerName,
              cursorColor: KMaiinColor,
              decoration: InputDecoration(
                  errorText: _validatename ? 'Name Can\'t Be Empty' : null,
                  hintText: 'Delegate name',
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: controllerLC,
              cursorColor: KMaiinColor,
              decoration: InputDecoration(
                  errorText: _validateLC ? "LC Can't Be Empty" : null,
                  hintText: 'LC',
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: controllerRoom,
              cursorColor: KMaiinColor,
              decoration: InputDecoration(
                  errorText:
                      _validateroom ? 'Room number Can\'t Be Empty' : null,
                  hintText: 'Room number',
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  controllerName.text.isEmpty
                      ? _validatename = true
                      : _validatename = false;
                  controllerLC.text.isEmpty
                      ? _validateLC = true
                      : _validateLC = false;
                  controllerRoom.text.isEmpty
                      ? _validateroom = true
                      : _validateroom = false;
                });
                if (_validateLC == false &&
                    _validatename == false &&
                    _validateroom == false) {
                  final user = User(
                      name: controllerName.text,
                      LC: controllerLC.text,
                      room: int.parse(controllerRoom.text));

                  createUser(user);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('You have successfully added a delegate')));
                  clearText();
                }
              },
              child: Text(
                'Add delegate',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
