import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  static String id = 'SignupScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: KMaiinColor,
      body: Form(
        key: _globalkey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/icons/buyicon.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        'Buy it',
                        style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * .1,
            ),
            CustomTextField(
              hint: 'Enter your username',
              icon: Icons.perm_identity,
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              hint: 'Enter your email',
              icon: Icons.email,
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              hint: 'Enter your password',
              icon: Icons.lock,
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    if (_globalkey.currentState!.validate()) {}
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do have an account ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
