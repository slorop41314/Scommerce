import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class KeyValueView extends StatelessWidget {
  final String label;
  final String value;
  KeyValueView({
    @required this.label,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: K.size.contentBottomPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.label,
          ),
          Text(
            this.value,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
