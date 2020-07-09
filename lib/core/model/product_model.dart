import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  String imageUrl;
  int price;
  String description;
  int soldCount;
  String weight;
  String condition;
  String category;
  List<dynamic> imageDetail;

  Product({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.price,
    @required this.description,
    @required this.soldCount,
    @required this.weight,
    @required this.condition,
    @required this.category,
    @required this.imageDetail,
  });

  Product.fromJson(Map<String, dynamic> parsedJSON, String id)
      : this.id = id,
        name = parsedJSON['name'],
        imageUrl = parsedJSON['imageUrl'],
        price = parsedJSON["price"],
        description = parsedJSON["description"],
        soldCount = parsedJSON["soldCount"],
        weight = parsedJSON["weight"],
        condition = parsedJSON["condition"],
        category = parsedJSON["category"],
        imageDetail = parsedJSON["imageDetail"];
}
