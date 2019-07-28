import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_mobile/config/api.dart';
import 'package:lulomart_mobile/view/view_splash_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = '';
String image = '';
String password = '';
String fullname = '';
String email = '';
String id;

class LoginPage extends StatelessWidget {

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff), width: 1),
              gradient: LinearGradient(
                colors: [Color(0xffFF4444), Color(0xff)],
                stops: [0, 1],
              )),
          child: LoginPageForm(),
        ),
      ),
      // routes: <String, WidgetBuilder>{
      //   '/MainPage': (BuildContext context) => new MainPage(),
      // },
    );
  }
}

class LoginPageForm extends StatefulWidget {
  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  TextEditingController user =
      new TextEditingController(text: "alan@gmail.com");
  TextEditingController pass = new TextEditingController(text: "alan");
  String msg = '';
  String pesan = '';
  Future<List> login() async {

    Api api = Api();
    
    final response = await http.post(api.login, body: {
      "identity": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);
    var d = datauser['user_data'];
    print(d);
    print(user.text);

    if (datauser['status'] == 0) {
      setState(() {
        pesan = "Username atau password salah!";
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Login"),
            content: new Text("$pesan"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      username(d["username"]);
      email(d["email"]);
      fullname(d["full_name"]);
      image(d["image"]);
      password(d["password"]);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => SplashScreenLogin()));
    }
    return null;
  }

  username(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'username';
    final value = token;
    prefs.setString(key, value);
  }

  email(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'email';
    final value = token;
    prefs.setString(key, value);
  }

  fullname(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'full_name';
    final value = token;
    prefs.setString(key, value);
  }

  image(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'image';
    final value = token;
    prefs.setString(key, value);
  }

  password(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'password';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35.0,
          child: Image.asset('assets/images/loginicon.jpeg')),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: user,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final password = TextFormField(
      controller: pass,
      obscureText: _secureText,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          onPressed: showHide,
          icon: Icon(_secureText ? Icons.visibility : Icons.visibility_off),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => login(),
        padding: EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 4),
        color: Colors.red,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Card(
          child: Container(
            width: 500,
            height: 300,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                SizedBox(height: 15.0),
                logo,
                SizedBox(height: 25.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 10.0),
                loginButton,
                FlatButton(
                  onPressed: () {},
                  child: Text("Forgot Password ?",
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
