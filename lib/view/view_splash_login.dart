import 'package:flutter/material.dart';
import 'package:lulomart_mobile/main_page.dart';
import 'dart:async';

class SplashScreenLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenLoginState();
  }
}

class SplashScreenLoginState extends State<SplashScreenLogin> {
final String title='';
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}

