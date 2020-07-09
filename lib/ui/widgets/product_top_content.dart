import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/utils/constant.dart';
import 'package:flutter_ecommerce/utils/helper.dart';

class ProductDetailTopContent extends StatelessWidget {
  const ProductDetailTopContent({
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
                        Stack(
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
                    )
                    .values
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}
