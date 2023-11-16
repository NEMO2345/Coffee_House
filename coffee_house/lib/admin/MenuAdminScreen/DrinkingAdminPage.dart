// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_final_fields, file_names, unused_element

import 'package:coffee_house/admin/ModelsAdmin-list/ListDrinkAdmin.dart';
import 'package:flutter/material.dart';

class DrinkingAdminPage extends StatefulWidget {
  DrinkingAdminPage({Key? key}) : super(key: key);

  @override
  _DrinKingPageState createState() => _DrinKingPageState();
}

class _DrinKingPageState extends State<DrinkingAdminPage> {
  Map<int, int> _quantityMap = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ListDrink.length,
      itemBuilder: (context, index) {
        final drink = ListDrink[index];
        final itemId = drink.id;

        if (!_quantityMap.containsKey(itemId)) {
          _quantityMap[itemId] = 0;
        }

        return ListTile(
          leading: Image.asset(drink.image),
          title: Text(drink.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$${drink.price.toStringAsFixed(2)}'),
              Text(drink.description),
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
                },
              ),
            ],
          ),
        );
      },
    );
  }
}