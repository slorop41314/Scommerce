import 'package:flutter/material.dart';

class Product {
  String name;
  String imageUrl;
  int price;
  String description;
  int soldCount;
  String weight;
  String condition;
  String category;

  Product({
    @required this.name,
    @required this.imageUrl,
    @required this.price,
    @required this.description,
    @required this.soldCount,
    @required this.weight,
    @required this.condition,
    @required this.category,
  });

  Product.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['name'],
        imageUrl = parsedJSON['imageUrl'],
        price = parsedJSON["price"],
        description = parsedJSON["description"],
        soldCount = parsedJSON["soldCount"],
        weight = parsedJSON["weight"],
        condition = parsedJSON["condition"],
        category = parsedJSON["category"];
}
