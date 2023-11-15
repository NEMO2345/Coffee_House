// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:coffee_house/admin/AllAdminScreen/MainAdminScreen.dart';
import 'package:flutter/material.dart';


class PurchaseHistoryPage extends StatelessWidget {
  const PurchaseHistoryPage({Key? key}) : super(key: key);

  @override
  Future<void> initState() async {
    getCurrentAdminInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hóa Đơn Mua Hàng',
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