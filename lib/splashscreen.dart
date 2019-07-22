import 'package:flutter/material.dart';
import 'package:lulomart_mobile/profilepage.dart';
import 'package:lulomart_mobile/historypage.dart';
import 'package:lulomart_mobile/storepage.dart';
import 'package:lulomart_mobile/loginpage.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget{
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();

    loadData();
  }

  @override 
  Widget build(BuildContext context) {
   return MaterialApp(
      home: Scaffold(
          body: Center(
            child: CircularProgressIndicator( 
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[200]),
            ),
          ),
        )
      );
    
  }

  Future<Timer> loadData() async {
  return Timer(Duration(seconds: 5), onDoneLoading);
}

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => StorePage()));
  }
}