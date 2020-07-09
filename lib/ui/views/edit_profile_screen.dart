import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/model/userModel.dart';

class EditProfileScreen extends StatefulWidget {
  static const route_name = "EditProfileScreen";
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _fullnameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    final User data = args["data"];
    _fullnameController.text = data.fullname;
    _emailController.text = data.email;
    _phoneNumberController.text = data.phoneNumber;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit profile"),
        actions: <Widget>[
          InkWell(
            onTap: () {
              print("Save edit profile");
            },
            child: SizedBox(
              width: 50,
              child: Icon(
                Icons.save,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  labelText: "Fullname",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Phone number",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
