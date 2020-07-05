import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final Function onChanged;
  final bool secured;
  final Icon prefixIcon;
  final bool inputNumber;
  CustomInput({
    @required this.label,
    @required this.onChanged,
    this.secured = false,
    this.prefixIcon,
    this.inputNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: this.secured,
        keyboardType:
            this.inputNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: this.prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: K.colors.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: K.colors.primary,
            ),
          ),
          labelText: this.label,
        ),
        onChanged: this.onChanged);
  }
}
