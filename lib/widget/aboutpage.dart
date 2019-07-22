import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/historypage.dart';
import 'package:lulomart_mobile/storepage.dart';
import 'package:lulomart_mobile/loginpage.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';

class About extends StatefulWidget {
  @override
  AboutLayout createState() => AboutLayout();
}

class AboutLayout extends State<About> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Row(
            children: <Widget>[
              LeftDrawer(),
              Expanded(
                flex: 12,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      
                    ],
                  ),
                ),
              ),
              // RightDrawerStorePage(),
            ],
          ),
        ),
      ),
    );
  }
}