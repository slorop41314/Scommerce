import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/ui/views/product_detail_screen.dart';
import 'package:flutter_ecommerce/utils/constant.dart';
import 'package:flutter_ecommerce/utils/helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductDetailScreen.route_name,
            arguments: {"data": product},
          );
        },
        child: Card(
          elevation: 3,
          child: Container(
            padding: K.size.cardProductPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 5),
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
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Text(
                  formatNumberToCurrency(
                    product.price.toDouble(),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
