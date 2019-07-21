import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/storepage.dart';

class HistoryPage extends StatefulWidget {
  @override
  HistoryPageLayout createState() => HistoryPageLayout();
}

class HistoryPageLayout extends State<HistoryPage> {
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
                flex: 18,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          child: null
                        ),
                      ),
                      Container(
                        height: 300.0,
                        child: null
                      ),
                    ],
                  ),
                ),
              ),
              //RightDrawer(),
            ],
          ),
        ),
      ),
    );
  }
}
