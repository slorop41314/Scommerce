import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/provider/user_provider.dart';
import 'package:flutter_ecommerce/ui/views/search_screen.dart';
import 'package:flutter_ecommerce/utils/constant.dart';
import 'package:provider/provider.dart';

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
        Consumer<UserProvider>(
          builder: (ctx, userProvider, _) => Text(
            userProvider.loading
                ? "Loading"
                : userProvider.error
                    ? "Error get user"
                    : userProvider.data.fullname,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: K.size.groupMargin,
        ),
        TextField(
          onTap: () {
            Navigator.of(context).pushNamed(SearchScreen.route_name);
          },
          readOnly: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: "Search product",
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
