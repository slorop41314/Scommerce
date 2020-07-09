import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/core/service/product_service.dart';

class SearchProvider with ChangeNotifier {
  final ProductService _productService = ProductService();
  List<Product> _data = [];
  bool _error = false;
  bool _loading = false;

  List<Product> get data {
    return _data;
  }

  get loading {
    return _loading;
  }

  get error {
    return _error;
  }

  void fetchData(String keyword) async {
    _loading = true;
    notifyListeners();
    _error = false;
    _data = await _productService.searchProductsByKeyword(keyword);
    _loading = false;
    notifyListeners();
  }
}
