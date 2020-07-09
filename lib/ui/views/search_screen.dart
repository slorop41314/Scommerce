import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/ui/shared/card/grid_product_card.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class SearchScreen extends StatefulWidget {
  static const route_name = "SearchScreen";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      name: "Test1 Test1 Test1 Test1",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.go,
          onSubmitted: (text) {
            print(text);
          },
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Meja makan",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child:
              // Consumer<ProductsProvider>(
              //   builder: (ctx, productProvider, _) {
              //     var size = MediaQuery.of(context).size;
              //     final double itemHeight = 210;
              //     final double itemWidth = size.width / 2;
              //     return
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: K.size.contentPadding,
                child: Text(
                  "Showing result",
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: productData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio:
                        (MediaQuery.of(context).size.width / 2) / 210,
                  ),
                  itemBuilder: (context, index) {
                    // Product product = productProvider.data[index];
                    Product product = productData[index];
                    return GridProductCard(
                      product: product,
                    );
                  },
                ),
              ),
            ],
            //       },
            //     ),
            //   ),
            // );
          ),
        ),
      ),
    );
  }
}
