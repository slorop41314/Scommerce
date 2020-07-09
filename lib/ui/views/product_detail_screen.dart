import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/ui/shared/button/button_primary.dart';
import 'package:flutter_ecommerce/ui/shared/button/button_secondary.dart';
import 'package:flutter_ecommerce/ui/shared/wrapper/key_value_wrap.dart';
import 'package:flutter_ecommerce/ui/widgets/product_top_content.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

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
                    ProductDetailTopContent(data: data),
                    Divider(
                      thickness: 5,
                    ),
                    ProductInformationContent(data: data),
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
            ProductDetailActionCard()
          ],
        ),
      ),
    );
  }
}

class ProductInformationContent extends StatelessWidget {
  const ProductInformationContent({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Product data;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}



class ProductDetailActionCard extends StatelessWidget {
  const ProductDetailActionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
