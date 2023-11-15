// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, override_on_non_overriding_member, equal_keys_in_map

import 'dart:io';
import 'package:coffee_house/admin/AllAdminScreen/LoginAdminScreen.dart';
import 'package:coffee_house/admin/AllAdminScreen/MainAdminScreen.dart';
import 'package:coffee_house/admin/AllAdminScreen/RegisterAdminScreen.dart';
import 'package:coffee_house/user/AllUserScreen/LoginUserScreen.dart';
import 'package:coffee_house/user/AllUserScreen/MainUserScreen.dart';
import 'package:coffee_house/user/AllUserScreen/RegisterUserScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Add this line to ignore certificate validation
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");
DatabaseReference adminsRef = FirebaseDatabase.instance.ref().child("admins");

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotifierClass?>(
          create: (BuildContext context) => NotifierClass(),
        ),
        Provider<DatabaseReference>(
          create: (BuildContext context) => usersRef,
        ),
      ],
      child: MaterialApp(
        title: 'Coffee house',
        theme: ThemeData(
          fontFamily: "Brand Bold",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          MainUserScreen.idScreen: (context) => MainUserScreen(),
          LoginUserScreen.idScreen: (context) => LoginUserScreen(),
          RegisterUserScreen.idScreen: (context) => RegisterUserScreen(),
          MainAdminScreen.idScreen: (context) => MainAdminScreen(),
          LoginAdminScreen.idScreen: (context) => LoginAdminScreen(),
          RegisterAdminScreen.idScreen: (context) => RegisterAdminScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MainUserScreen.idScreen);
              },
              child: Text('Login as User'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MainAdminScreen.idScreen);
              },
              child: Text('Login as Admin'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class NotifierClass extends ChangeNotifier {
  static const String idScreen = "/";

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}