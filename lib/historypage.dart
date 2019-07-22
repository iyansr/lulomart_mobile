import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/historylist.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/storepage.dart';
import 'package:lulomart_mobile/widget/right_drawer_historypage.dart';

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
                flex: 10,
                child: HistoryList(),
              ),
              RightDrawerHistoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}
