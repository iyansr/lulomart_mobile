import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff), width: 1),
                gradient: LinearGradient(
                  colors: [Color(0xffFF4444), Color(0xff)],
                  stops: [0, 1],
                )),
            child: LoginPageForm(),
          ),
        ),
      ),
    );
  }
}

class LoginPageForm extends StatelessWidget {
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
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
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
        onPressed: () {},
        padding: EdgeInsets.all(12),
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
                SizedBox(height: 30.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 15.0),
                loginButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
