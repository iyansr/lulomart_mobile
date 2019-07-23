import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/widget_profilepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageLayout createState() => ProfilePageLayout();
}

class ProfilePageLayout extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Container(
                  child: Image.asset('assets/images/users.jpeg'),
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.all(5.0),
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              )),
          Text(
            "Harold",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Cashier",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
          RaisedButton(
            child: const Text('Change Role'),
            color: Colors.white,
            elevation: 4.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
