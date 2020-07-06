import 'package:flutter/material.dart';

class User {
  String fullname;
  String email;
  String phoneNumber;

  User({
    @required this.fullname,
    @required this.email,
    @required this.phoneNumber,
  });

  User.fromJson(Map<String, dynamic> parsedJSON)
      : fullname = parsedJSON['fullname'],
        phoneNumber = parsedJSON['phone_number'],
        email = parsedJSON["email"];
}
