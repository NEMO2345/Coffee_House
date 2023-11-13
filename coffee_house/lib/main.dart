// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:io';
import 'package:coffee_house/AllScreen/RegisterScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AllScreen/LoginScreen.dart';
import 'AllScreen/MainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//Khoi tao fl utter framework
  await Firebase.initializeApp();//Khoi tao firebase
  // Add this line to ignore certificate validation
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {  },
      child: MaterialApp(
        title: 'Coffee house',
        theme: ThemeData(
          fontFamily: "Brand Bold",
          primarySwatch: Colors.blue,//The banner color
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen.idScreen : MainScreen.idScreen,
        routes:
        {
          RegisterScreen.idScreen: (context) => RegisterScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
        },
        debugShowCheckedModeBanner: false,//Remove the banner
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }

}

