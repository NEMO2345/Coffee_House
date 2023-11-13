// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, file_names
import 'package:flutter/material.dart';

class StoreTabPage extends StatelessWidget {
  const StoreTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "This is store tabpage"
        ),

        Divider(height: 2.0,thickness: 2.0,),
      ],
    );
  }
}
