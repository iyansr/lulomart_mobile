import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/widget_historylist.dart';
import 'package:lulomart_mobile/widget/widget_historypage.dart';
import 'package:lulomart_mobile/widget/widget_storepage.dart';

class StorePage extends StatefulWidget {
  @override
  StorePageLayout createState() => StorePageLayout();
}

class StorePageLayout extends State<StorePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    mainPage = StorePage();
    rightDrawer = RightDrawerStorePage();
  }

  var mainPage;
  var rightDrawer;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                        colors: [
                          Color(0xfff84c35),
                          Color(0xfff96f5d),
                        ],
                        stops: [0, 1],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {});
                            },
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
                            onPressed: () {
                              setState(() {
                                mainPage = StorePage();
                                rightDrawer = RightDrawerStorePage();
                              });
                            },
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
                            onPressed: () {
                              setState(() {
                                mainPage = HistoryList();
                                rightDrawer = RightDrawerHistoryPage();
                              });
                            },
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
              Expanded(
                flex: 15,
                child: mainPage,
              ),
              Expanded(
                flex: 8,
                child: rightDrawer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
