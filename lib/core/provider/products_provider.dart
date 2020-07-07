import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/core/service/product_service.dart';

class ProductsProvider with ChangeNotifier {
  final ProductService _productService = ProductService();
  List<Product> _productData;
  bool _error = false;
  bool _loading = true;

  List<Product> get data {
    return _productData;
  }

  get loading {
    return _loading;
  }

  get error {
    return _error;
  }

  void fetchData() async {
    _error = false;
    _loading = false;
    _productData = await _productService.getProductsData();
    notifyListeners();
  }
}
