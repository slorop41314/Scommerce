import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/product_model.dart';
import 'package:flutter_ecommerce/core/provider/bestseller_products_provider.dart';
import 'package:flutter_ecommerce/core/provider/products_provider.dart';
import 'package:flutter_ecommerce/core/provider/user_provider.dart';
import 'package:flutter_ecommerce/ui/shared/card/grid_product_card.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final userProvider = context.read<UserProvider>();
      final productsProvider = context.read<ProductsProvider>();
      final bestsellerProvider = context.read<BestSellerProductsProvider>();
      userProvider.fetchUserData();
      productsProvider.fetchData();
      bestsellerProvider.fetchData();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Barang terlaris",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     print("Lihat semua produk terlaris");
                    //   },
                    //   child: Text(
                    //     "Lihat semua",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w800,
                    //       color: kColorPrimary,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  height: 200,
                  child: Consumer<BestSellerProductsProvider>(
                    builder: (ctx, bestsellerProvider, _) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bestsellerProvider.data.length,
                      itemBuilder: (context, index) {
                        Product product = bestsellerProvider.data[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: K.size.contentPadding,
                  child: Text(
                    "Explore",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Consumer<ProductsProvider>(
                  builder: (ctx, productProvider, _) {
                    var size = MediaQuery.of(context).size;
                    final double itemHeight = 210;
                    final double itemWidth = size.width / 2;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: productProvider.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: itemWidth / itemHeight,
                      ),
                      itemBuilder: (context, index) {
                        Product product = productProvider.data[index];
                        return GridProductCard(
                          product: product,
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
