import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RightDrawerProfilePage extends StatefulWidget {
  @override
  _RightDrawerProfilePageState createState() => _RightDrawerProfilePageState();
}

class _RightDrawerProfilePageState extends State<RightDrawerProfilePage> {
  String email = "";
  String password = "";

  read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'email';
    final value = prefs.get(key) ?? "jgfjhg";
    key = 'password';
    final password = prefs.get(key) ?? "jgfjhg";

    setState(() {
      email = value;
      this.password = password;
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
    return SingleChildScrollView(
      child: Container(
        height: 480,
        decoration: BoxDecoration(color: Colors.black87),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5.0)),
              SizedBox(height: 1.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: email,
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(1.0)),
              SizedBox(height: 1.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "0855 0855 0855",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                height: 20,
                color: Colors.white,
              ),
              //Password Change Form
              Padding(padding: EdgeInsets.all(1.0)),
              SizedBox(height: 1.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: password,
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(1.0)),
              SizedBox(height: 1.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "New Password",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(1.0)),
              SizedBox(height: 1.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Confirm New Password",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(1.0)),
              SizedBox(height: 1.0),
              Padding(
                padding: const EdgeInsets.only(left: 250.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.all(12),
                  color: Colors.red,
                  child: Text('Confirm', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
