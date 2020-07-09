import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final Function onTap;
  SecondaryButton({
    @required this.label,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: OutlineButton(
        borderSide: BorderSide(
          color: kColorPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        onPressed: onTap,
        child: Text(
          this.label,
          style: TextStyle(
            color: kColorPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
