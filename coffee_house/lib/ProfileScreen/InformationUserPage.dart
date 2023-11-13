// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:coffee_house/ProfileScreen/ChangePassword.dart';
import 'package:flutter/material.dart';

import '../Configs.dart';

class InformationUserPage extends StatelessWidget {
  const InformationUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin tài khoản',
          style: TextStyle(
            color: Colors.lime,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  children: [
                    Image.asset(
                      'images/astronaut.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      userInformation?.name ?? "Ly",
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Brand Bold",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Khách hàng mới',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Thông tin cá nhân',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePassword()),
                      );
                    },
                    child: Text(
                      'Đổi mật khẩu',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                userInformation?.email ?? '',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Số điện thoại',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                userInformation?.phone ?? '',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                onPrimary: Colors.black,
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Brand Bold',
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: Text('Sửa thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}