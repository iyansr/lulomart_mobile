import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lulomart_mobile/main_page.dart';

class SplashScreen extends StatelessWidget {
  // @override
  // void initState(){
  //   super.initState();

  //   loadData();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[200]),
        ),
      ),
    ));

    onDoneLoading() async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MainPage()));
    }

    Future<Timer> loadData() async {
      return Timer(Duration(seconds: 5), onDoneLoading);
    }
  }
}
