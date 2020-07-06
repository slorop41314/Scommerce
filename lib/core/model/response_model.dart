import 'package:flutter/material.dart';

class Response {
  bool isSuccess;
  final data;
  String message;

  Response({
    @required this.data,
    @required this.isSuccess,
    @required this.message,
  });
}
