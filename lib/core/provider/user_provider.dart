import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/userModel.dart';
import 'package:flutter_ecommerce/core/service/user_service.dart';

class UserProvider with ChangeNotifier {
  final userService = UserService();
  User _userData;
  bool _error = false;
  bool _loading = true;

  User get data {
    return _userData;
  }

  get loading {
    return _loading;
  }

  get error {
    return _error;
  }

  void fetchUserData() async {
    _error = false;
    _loading = false;
    _userData = await userService.getUserData();
    notifyListeners();
  }
}
