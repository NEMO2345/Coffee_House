// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously, deprecated_member_use, avoid_function_literals_in_foreach_calls

import 'package:coffee_house/admin/AllAdminScreen/RegisterAdminScreen.dart';
import 'package:coffee_house/main.dart';
import 'package:coffee_house/user/AllUserScreen/MainUserScreen.dart';
import 'package:coffee_house/user/MenuUserScreen/PopularUserPage.dart';
import 'package:coffee_house/user/ModelsUser/Users-User.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'cartItems.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  List<CartItem> cartItems = [];
  int totalQuantity = 0;
  int totalPrice = 0;
  String address = "";
  String phoneNumber = "";
  String name = "";


  @override
  void initState() {
    super.initState();
    fetchCartItems();
    fetchContactInfo();
  }
  Future<void> fetchContactInfo() async {
    try {
      DatabaseEvent event = await usersContact.once();
      DataSnapshot snapshot = event.snapshot;
      var data = snapshot.value;
      if (data != null && data is Map) {
        setState(() {
          address = data['address'] ?? '';
          phoneNumber = data['phoneNumber'] ?? '';
          name = data['name'] ?? '';
        });
      }
    } catch (error) {
      displayToastMessage("$error", context);
    }
  }

  Future<void> fetchCartItems() async {
    try {
      DatabaseEvent event = await usersCartRef.once();
      DataSnapshot snapshot = event.snapshot;
      var data = snapshot.value;
      if (data != null) {
        setState(() {
          Map<dynamic, dynamic>? cartData = data as Map<dynamic, dynamic>?;
          if (cartData != null) {
            cartItems = cartData.entries.map((entry) {
              return CartItem.fromMap(
                  entry.key, entry.value as Map<dynamic, dynamic>);
            }).toList();
          }
        });

        cartItems.forEach((item) {
          totalQuantity += item.quantity;
          totalPrice += item.price * item.quantity;
        });
      }
    } catch (error) {
      displayToastMessage("$error", context);
    }
  }
  void handlePayment(){
    sendOrderToAdmin();
    displayToastMessage("Đặt đơn thành công!!", context);
    Navigator.pushNamedAndRemoveUntil(context, MainUserScreen.idScreen, (route) => false);
  }
  void sendOrderToAdmin()  {
    List<Map<String, dynamic>> orderList = [];

    cartItems.forEach((item) {
      Map<String, dynamic> productInfo = {
        'Tên sản phẩm': item.name,
        'Giá tiền': item.price,
        'Số lượng':item.quantity,
      };
      orderList.add(productInfo);
    });

    Map<String, dynamic> orderInfo = {
      'Tên khách hàng': name,
      'Số điện thoại': phoneNumber,
      'Địa chỉ': address,
      'Thông tin sản phẩm': orderList,
    };

    int totalAmount = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    orderInfo['Tổng tiền'] = totalAmount;
    adminOrder.set(orderInfo);
    usersCartRef.remove();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thanh toán',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Thông tin đơn hàng',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 5.0,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                String image = cartItems[index].image;
                String name = cartItems[index].name;
                int price = cartItems[index].price;
                int quantity = cartItems[index].quantity;

                return ListTile(
                  leading: Image.network(image),
                  title: Text(name),
                  subtitle: Text('Giá: $price'),
                  trailing: Text('Số lượng : $quantity'),
                );
              },
            ),
          ),
          Divider(
            height: 20.0,
            thickness: 5.0,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tổng số lượng:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '$totalQuantity',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tổng thành tiền:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '$totalPrice VNĐ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            'Tên :',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Địa chỉ:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            address,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Số điện thoại:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            phoneNumber,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              handlePayment();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(
                  color: Colors.orange,
                  width: 2,
                ),
              ),
              backgroundColor: Colors.white,
            ),
            child: Text(
              'Thanh toán',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}