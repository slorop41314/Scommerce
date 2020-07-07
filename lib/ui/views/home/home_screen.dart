import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/core/provider/user_provider.dart';
import 'package:flutter_ecommerce/ui/shared/card/product_card.dart';
import 'package:flutter_ecommerce/ui/widgets/home_header.dart';
import 'package:flutter_ecommerce/utils/constant.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const route_name = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productData = [
    Product(
      name:
          "Test1 Test1 Test1 Test1 Test1 Test1 Test1 Test1 Test1 Test1 Test1 ",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTUx_8FAOzqAwtYCiWTVzHlf329xVksDG-ww&usqp=CAU",
      price: 1234,
      description: "This is a dummy product",
      soldCount: 0,
      weight: "200 G",
      condition: "New",
      category: "Chair",
    ),
    Product(
      name: "Test2",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTUx_8FAOzqAwtYCiWTVzHlf329xVksDG-ww&usqp=CAU",
      price: 1234,
      description: "This is a dummy product",
      soldCount: 0,
      weight: "200 G",
      condition: "New",
      category: "Chair",
    ),
    Product(
      name: "Test3",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTUx_8FAOzqAwtYCiWTVzHlf329xVksDG-ww&usqp=CAU",
      price: 1234,
      description: "This is a dummy product",
      soldCount: 0,
      weight: "200 G",
      condition: "New",
      category: "Chair",
    ),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userProvider = context.read<UserProvider>();
      userProvider.fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: K.size.bodyPadding,
        child: Column(
          children: <Widget>[
            HomeHeader(),
            SizedBox(
              height: K.size.groupMargin,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Barang terlaris"),
                    InkWell(
                      onTap: () {
                        print("Lihat semua produk terlaris");
                      },
                      child: Text(
                        "Lihat semua",
                        style: TextStyle(
                          color: kColorPrimary,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productData.length,
                    itemBuilder: (context, index) {
                      Product product = productData[index];
                      return ProductCard(product: product);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
