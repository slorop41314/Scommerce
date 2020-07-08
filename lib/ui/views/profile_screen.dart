import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/service/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  static const route_name = "ProfileScreen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final actionsList = [
    {
      "icon": Icons.local_shipping,
      "title": "My Orders",
      "onPress": () => {print("My orders tapped")},
    },
    {
      "icon": Icons.help,
      "title": "Help",
      "onPress": () => {},
    },
    {
      "icon": Icons.phonelink_lock,
      "title": "Privacy policy",
      "onPress": () => {},
    },
    {
      "icon": Icons.list,
      "title": "Terms of Services",
      "onPress": () => {},
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: actionsList.length,
                  itemBuilder: (context, index) {
                    final action = actionsList[index];
                    return ListTile(
                      onTap: action["onPress"],
                      leading: Icon(
                        action["icon"],
                      ),
                      title: Text(
                        action["title"],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  AuthService.shared.logoutUser();
                  Navigator.of(context).pushReplacementNamed("/");
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
