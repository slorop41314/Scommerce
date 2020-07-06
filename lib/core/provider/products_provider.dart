import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';

class ProductsProvider with ChangeNotifier {
  Product _productData;
  bool _error = false;
  bool _loading = true;

  Product get data {
    return _productData;
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
    // _productData = await userService.getUserData();
    notifyListeners();
  }
}
