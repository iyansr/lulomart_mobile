import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/widget/right_drawer.dart';
import 'package:lulomart_mobile/widget/textfieldicon.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
            ],
          ),
        ),
      ),
    );
  }
}
