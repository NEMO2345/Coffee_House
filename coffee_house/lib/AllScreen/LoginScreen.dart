// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/logo.png'),
                width: 170,
                height: 170,
              ),
              SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tên đăng nhập',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  Text('Lưu đăng nhập'),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('Quên mật khẩu?'),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lime,
                      side: BorderSide(color: Colors.lime),
                    ),
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image(
                  image: AssetImage('images/gmail.png'),
                ),
                label: Text('Đăng nhập bằng Email'),
              ),
              SizedBox(height: 10.0),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image(
                  image: AssetImage('images/search.png'),
                ),
                label: Text('Đăng nhập với Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}