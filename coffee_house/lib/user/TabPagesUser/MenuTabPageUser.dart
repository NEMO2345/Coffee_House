// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_house/user/MenuUserScreen/DrinkingUserPage.dart';
import 'package:coffee_house/user/MenuUserScreen/FootUserPage.dart';
import 'package:coffee_house/user/MenuUserScreen/PopularUserPage.dart';
import 'package:flutter/material.dart';

class MenuTabPageUser extends StatelessWidget {
  const MenuTabPageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
      Divider(
            height: 30.0,
            thickness: 20.0,
           ),
          TabBar(
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Brand bold',
            ),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.amber,
            tabs: [
              Tab(text: 'PHỔ BIẾN'),
              Tab(text: 'LOẠI UỐNG'),
              Tab(text: 'LOẠI ĂN'),
            ],
          ),
          Divider(height: 2.0, thickness: 2.0),
          Expanded(
            child: TabBarView(
              children: [
                PopularUserPage(),
                DrinkingUserPage(),
                FootUserPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}