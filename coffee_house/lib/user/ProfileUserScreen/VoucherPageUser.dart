// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, override_on_non_overriding_member

import 'package:coffee_house/user/AllUserScreen/MainUserScreen.dart';
import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  Future<void> initState() async {
    getCurrentUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mã Khuyến Mãi',
          style: TextStyle(
            color: Colors.lime,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}