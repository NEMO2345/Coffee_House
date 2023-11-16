// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_final_fields, file_names

import 'package:coffee_house/admin/ModelsAdmin-list/ListPopularAdmin.dart';
import 'package:flutter/material.dart';

class PopularAdminPage extends StatefulWidget {
  PopularAdminPage({Key? key}) : super(key: key);

  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularAdminPage> {
  Map<int, int> _quantityMap = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final popular = drinks[index];
        final itemId = popular.id;

        if (!_quantityMap.containsKey(itemId)) {
          _quantityMap[itemId] = 0;
        }

        return ListTile(
          leading: Image.asset(popular.image),
          title: Text(popular.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$${popular.price.toStringAsFixed(2)}'),
              Text(popular.description),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    int? quantity = _quantityMap[itemId];
                    if (quantity != null && quantity > 0) {
                      _quantityMap[itemId] = quantity - 1;
                    }
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Xử lý sự kiện chỉnh sửa số lượng sản phẩm ở đây
                },
              ),
            ],
          ),
        );
      },
    );
  }
}