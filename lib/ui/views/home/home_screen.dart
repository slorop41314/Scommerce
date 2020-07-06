import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/core/service/user_service.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

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
    UserService.shared.getUserData();
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
                          color: K.colors.primary,
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
                      return Container(
                        height: 200,
                        width: 150,
                        child: Card(
                          child: Container(
                            padding: K.size.cardProductPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.orangeAccent,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Image.network(
                                    product.imageUrl,
                                    height: 120,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  product.price.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
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

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Good afternoon,",
        ),
        Text(
          "Albert",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: K.size.groupMargin,
        ),
        TextField(
          onTap: () {
            print("Navigate to search screen");
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: "Search product",
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: K.colors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
