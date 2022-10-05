import 'package:buy_it/screens/admin/adddelegate.dart';
import 'package:buy_it/screens/admin/adminHome.dart';
import 'package:buy_it/screens/admin/admintrackorder.dart';
import 'package:buy_it/screens/category_mershandise_screen.dart';
import 'package:buy_it/screens/edit_data.dart';
import 'package:buy_it/screens/homepage.dart';
import 'package:buy_it/screens/login_screen.dart';
import 'package:buy_it/screens/mershandise_categories_screen.dart';
import 'package:buy_it/screens/product_details_screen.dart';
import 'package:buy_it/screens/rooming_list.dart';
import 'package:buy_it/screens/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge:
                    TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
                titleMedium:
                    TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
                titleSmall:
                    TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          AdminHome.id: (context) => AdminHome(),
          Adddelegate.id: (context) => Adddelegate(),
          HomePage.id: (context) => HomePage(),
          Mersh.id: (context) => Mersh(),
          CategoryMershandiseScreen.id: (context) =>
              CategoryMershandiseScreen(),
          ProductDetailScreen.id: (context) => ProductDetailScreen(),
          RoomingList.id: (context) => RoomingList(),
          SoldMersh.id: (context) => SoldMersh(),
          EditPage.id: (context) => EditPage(),
        },
      );
    });
  }
}
