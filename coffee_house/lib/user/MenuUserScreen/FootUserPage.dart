// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields

import 'package:coffee_house/user/ModelsUser-list/ListFoodUser.dart';
import 'package:flutter/material.dart';

class FootUserPage extends StatefulWidget {
  FootUserPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FootPageState createState() => _FootPageState();
}

class _FootPageState extends State<FootUserPage> {
  Map<int, int> _quantityMap = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listFood.length,
      itemBuilder: (context, index) {
        final food = listFood[index];
        final itemId = food.id;

        if (!_quantityMap.containsKey(itemId)) {
          _quantityMap[itemId] = 0;
        }

        return ListTile(
          leading: Image.asset(food.image),
          title: Text(food.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$${food.price.toStringAsFixed(2)}'),
              Text(food.description),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    int? quantity = _quantityMap[itemId];
                    if (quantity != null && quantity > 0) {
                      _quantityMap[itemId] = quantity - 1;
                    }
                  });
                },
              ),
              Text(_quantityMap[itemId].toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    int? quantity = _quantityMap[itemId];
                    if (quantity != null) {
                      _quantityMap[itemId] = quantity + 1;
                    }
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  // Xử lý sự kiện khi nhấn nút thêm vào giỏ hàng
                },
              ),
            ],
          ),
        );
      },
    );
  }
}