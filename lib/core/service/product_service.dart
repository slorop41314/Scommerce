import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class ProductService {
  static final shared = ProductService();
  Firestore _firestore = Firestore.instance;

  Future<List<Product>> getProductsData() async {
    List<Product> productsData = [];
    QuerySnapshot querySnapshot = await _firestore
        .collection(DBCollection.productCollection)
        .getDocuments();
    for (var product in querySnapshot.documents) {
      var prod = Product.fromJson(product.data);
      productsData.add(prod);
    }
    return productsData;
  }

  Future<List<Product>> getBestsellerData() async {
    List<Product> productsData = [];
    QuerySnapshot querySnapshot = await _firestore
        .collection(DBCollection.productCollection)
        .orderBy("soldCount", descending: true)
        .limit(5)
        .getDocuments();
    for (var product in querySnapshot.documents) {
      var prod = Product.fromJson(product.data);
      productsData.add(prod);
    }
    return productsData;
  }

  Future<List<Product>> searchProductsByKeyword(String keyword) async {
    List<Product> productsData = [];
    QuerySnapshot querySnapshot = await _firestore
        .collection(DBCollection.productCollection)
        .orderBy("name")
        .where("name", isGreaterThanOrEqualTo: keyword)
        .where("name", isLessThanOrEqualTo: keyword + "z")
        .getDocuments();
    for (var product in querySnapshot.documents) {
      var prod = Product.fromJson(product.data);
      productsData.add(prod);
    }
    return productsData;
  }
}
