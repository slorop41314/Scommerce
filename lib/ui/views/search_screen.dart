import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/core/provider/search_provider.dart';
import 'package:flutter_ecommerce/ui/shared/card/grid_product_card.dart';
import 'package:flutter_ecommerce/utils/constant.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const route_name = "SearchScreen";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final searchProv = Provider.of<SearchProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.go,
          onSubmitted: (text) {
            searchProv.fetchData(text);
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
          padding: K.size.bodyPadding,
          child: Consumer<SearchProvider>(
            builder: (ctx, productProvider, _) {
              var size = MediaQuery.of(context).size;
              final double itemHeight = 210;
              final double itemWidth = size.width / 2;
              return Column(
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
                      itemCount: productProvider.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: itemWidth / itemHeight,
                      ),
                      itemBuilder: (context, index) {
                        // Product product = productProvider.data[index];
                        Product product = productProvider.data[index];
                        return GridProductCard(
                          product: product,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
