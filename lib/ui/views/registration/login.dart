import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/shared/input/input.dart';
import 'package:flutter_ecommerce/core/service/auth_service.dart';
import 'package:flutter_ecommerce/ui/views/registration/register.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  static const route_name = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";

  void _onTapLogin() async {
    if (_email == "" || _password == "") {
      print("Empty user em n pass");
    } else {
      final res = await AuthService.shared.loginUserByEmail(
        this._email,
        this._password,
      );
      if (res.isSuccess) {
        Navigator.of(context).pushReplacementNamed("/");
      } else {
        print("Error");
      }
    }
  }

  void _onTapLoginWithGoogle() async {
    AuthService.shared.signInWithGoogle().whenComplete(
          () => print(
            "Sign in with google",
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: K.size.bodyPadding,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Center(
                    child: Text("Your logo here"),
                  ),
                ),
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: K.size.contentGap,
                ),
                Text("Login to your existing account"),
                SizedBox(
                  height: K.size.wideGroupGap,
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
                  height: K.size.contentGap,
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
                  height: K.size.contentGap,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: _onTapLogin,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: K.colors.primary,
                    disabledColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: K.size.groupMargin,
                ),
                Text(
                  "Or connect using",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: K.size.contentGap,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mail,
                      ),
                      color: Colors.blue,
                      label: Text(
                        "Facebook",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: K.size.groupMargin,
                    ),
                    RaisedButton.icon(
                      onPressed: _onTapLoginWithGoogle,
                      icon: Icon(
                        Icons.mail,
                      ),
                      color: Colors.red,
                      label: Text(
                        "Google",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: K.size.contentGap,
                ),
                Row(
                  children: <Widget>[
                    Text("Dont have an account? "),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RegisterScreen.route_name,
                        );
                      },
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
