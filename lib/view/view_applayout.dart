import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/view/view_profile.dart';
import 'package:lulomart_mobile/view/view_store.dart';
import 'package:lulomart_mobile/widget/widget_historylist.dart';

class App extends StatefulWidget {
  @override
  AppLayout createState() => AppLayout();
}

class AppLayout extends State<App> {
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
              Container(
                child: Expanded(
                  flex: 2,
                  child: Container(
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xfff84c35), Color(0xfff96f5d)],
                          stops: [0, 1]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.person,
                            ),
                            shape: CircleBorder(),
                            elevation: 2.0,
                            fillColor: Colors.white,
                            padding: const EdgeInsets.all(10.0),
                          ),
                          SizedBox(height: 15.0),
                          RawMaterialButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.shopping_cart,
                            ),
                            shape: CircleBorder(),
                            elevation: 2.0,
                            fillColor: Color(0xfff96f5d),
                            padding: const EdgeInsets.all(10.0),
                          ),
                          SizedBox(height: 5.0),
                          RawMaterialButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.local_offer,
                            ),
                            shape: CircleBorder(),
                            elevation: 2.0,
                            fillColor: Color(0xfff96f5d),
                            padding: const EdgeInsets.all(10.0),
                          ),
                          SizedBox(height: 5.0),
                          RawMaterialButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.bookmark,
                            ),
                            shape: CircleBorder(),
                            elevation: 2.0,
                            fillColor: Color(0xfff96f5d),
                            padding: const EdgeInsets.all(10.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              HistoryList(),
              RightDrawerHistoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}
