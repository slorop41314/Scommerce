import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/shared/input/input.dart';
import 'package:flutter_ecommerce/core/service/auth_service.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class RegisterScreen extends StatefulWidget {
  static const route_name = "RegisterScreen";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = "";
  String _password = "";
  String _fullname = "";
  String _phoneNum = "";

  void _onTapRegister() async {
    if (_email == "" || _password == "" || _fullname == "" || _phoneNum == "") {
      print({_email, _password, _fullname, _phoneNum});
      print("Register didnt complete");
    } else {
      final res = await AuthService.shared.registerUserByEmail(
        _email,
        _password,
        _fullname,
        _phoneNum,
      );
      if (res.isSuccess) {
        Navigator.of(context).pushReplacementNamed("/");
      } else {
        print(res.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: K.size.bodyPadding,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Register",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: K.size.contentGap,
                ),
                Text(
                  "Fill in the form below",
                ),
                SizedBox(
                  height: 40,
                ),
                CustomInput(
                  label: "Fullname",
                  prefixIcon: Icon(Icons.person),
                  onChanged: (text) {
                    setState(() {
                      _fullname = text;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomInput(
                  label: "Email",
                  prefixIcon: Icon(Icons.mail),
                  onChanged: (text) {
                    setState(() {
                      _email = text;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomInput(
                  label: "Phone Number",
                  prefixIcon: Icon(Icons.phone_iphone),
                  inputNumber: true,
                  onChanged: (text) {
                    setState(() {
                      _phoneNum = text;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomInput(
                  label: "Password",
                  prefixIcon: Icon(Icons.lock),
                  secured: true,
                  onChanged: (text) {
                    setState(() {
                      _password = text;
                    });
                  },
                ),
                SizedBox(
                  height: K.size.groupMargin,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: _onTapRegister,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: K.colors.primary,
                    disabledColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
