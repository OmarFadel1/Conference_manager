import 'package:buy_it/screens/admin/adminHome.dart';
import 'package:buy_it/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/constants.dart';
import 'package:sizer/sizer.dart';

import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  String _errorMessage(String str) {
    switch (hint) {
      case 'Enter your username':
        return 'Name is empty';
      case 'Enter your identity':
        return 'identity is empty';
      case 'Enter your password':
        return 'Password is empty';
    }
    return '';
  }

  CustomTextField({required this.icon, required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(hint);
          } else if (hint == 'Enter your identity' &&
              (value == 'Admin' || value == 'admin')) {
            Navigator.pop(context, LoginScreen.id);
            Navigator.pushNamed(context, AdminHome.id);
          } else if (hint == 'Enter your identity' && value == 'omar') {
            Navigator.pop(context, LoginScreen.id);
            Navigator.pushNamed(context, HomePage.id);
          } else {
            return 'Invalid user identity';
          }
        },
        obscureText: hint == 'Enter your password' ? true : false,
        cursorColor: KMaiinColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: KMaiinColor,
          ),
          filled: true,
          fillColor: KSecondaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
