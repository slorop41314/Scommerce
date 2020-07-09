import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/ui/shared/button/button_primary.dart';
import 'package:flutter_ecommerce/ui/shared/button/button_secondary.dart';
import 'package:flutter_ecommerce/ui/shared/wrapper/key_value_wrap.dart';
import 'package:flutter_ecommerce/utils/constant.dart';
import 'package:flutter_ecommerce/utils/helper.dart';

class ProductDetailScreen extends StatefulWidget {
  static const route_name = "ProductDetailScreen";
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    final Product data = args["data"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product detail",
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              print("Cart");
            },
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
          InkWell(
            onTap: () {
              print("Option");
            },
            child: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: K.size.bodyHorizontalPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              width: double.infinity,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  disableCenter: true,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1.0,
                                  aspectRatio: 3 / 2,
                                ),
                                items: data.imageDetail
                                    .asMap()
                                    .map(
                                      (ind, item) => MapEntry(
                                        ind,
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Stack(
                                            children: <Widget>[
                                              Image.network(
                                                item,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                bottom: 10.0,
                                                left: 10.0,
                                                child: Container(
                                                  width: 40,
                                                  height: 20,
                                                  color: Colors.grey,
                                                  child: Center(
                                                    child: Text(
                                                      "${ind + 1} / ${data.imageDetail.length}",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .values
                                    .toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: K.size.contentBottomPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  formatNumberToCurrency(
                                    data.price.toDouble(),
                                  ),
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: K.size.contentBottomPadding,
                            child: Text(
                              data.name,
                            ),
                          ),
                          Padding(
                            padding: K.size.contentBottomPadding,
                            child: Text(
                              "Terjual ${data.soldCount}",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 5,
                    ),
                    Padding(
                      padding: K.size.bodyHorizontalPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Infomasi produk",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          KeyValueView(
                            label: "Berat",
                            value: data.weight,
                          ),
                          KeyValueView(
                            label: "Kondisi",
                            value: data.condition,
                          ),
                          KeyValueView(
                            label: "Kategori",
                            value: data.category,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 5,
                    ),
                    Padding(
                      padding: K.size.bodyHorizontalPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Deskripsi produk",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            data.description,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: PrimaryButton(
                        label: "Beli Langsung",
                        onTap: () {
                          print("Beli langsung");
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SecondaryButton(
                        label: "+ Keranjang",
                        onTap: () {
                          print("Beli keranjang");
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
