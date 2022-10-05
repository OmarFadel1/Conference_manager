import 'package:buy_it/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  static String id = 'LoginScreen';
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
              padding: EdgeInsets.only(top: 8.h),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/icons/buyicon.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        'Activate\'22',
                        style:
                            TextStyle(fontFamily: 'Pacifico', fontSize: 20.sp),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            CustomTextField(
              hint: 'Enter your identity',
              icon: Icons.perm_identity,
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                  onPressed: () {
                    if (_globalkey.currentState!.validate()) {}
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
