import 'package:flutter/material.dart';
import 'package:lulomart_mobile/main_page.dart';
import 'dart:async';

import 'package:lulomart_mobile/view/view_login.dart';

class SplashScreenLogout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenLogoutState();
  }
}

class SplashScreenLogoutState extends State<SplashScreenLogout> {
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
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
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

