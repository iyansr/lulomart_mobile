import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lulomart_mobile/widget/widget_profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  List list;
  int index;
  ProfilePage({this.index, this.list});

  @override
  ProfilePageLayout createState() => ProfilePageLayout();
}

class ProfilePageLayout extends State<ProfilePage> {
  String name = "";
  String image = "";
  read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'full_name';
    final value = prefs.get(key) ?? "jgfjhg";
    key = 'image';
    final image = prefs.get(key) ?? "jgfjhg";

    setState(() {
      name = value;
      this.image = image;
    });
    debugPrint('read : $value');
  }

  @override
  void initState() {
    read();
    super.initState();
  }

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
                  child: Image.network(
                      "http://todolist.madukubah.com/uploads/users_photo/" +
                          image),
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.all(5.0),
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              )),
          Text(
            name,
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
