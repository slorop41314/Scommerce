import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onTap;
  PrimaryButton({
    @required this.label,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: FlatButton(
        color: kColorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        onPressed: onTap,
        child: Text(
          this.label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
