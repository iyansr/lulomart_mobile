import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/widget/right_drawer_storepage.dart';
import 'package:lulomart_mobile/widget/storeitempage.dart';
import 'package:lulomart_mobile/widget/textfieldicon.dart';

class StorePage extends StatefulWidget {
  @override
  StorePageLayout createState() => StorePageLayout();
}

class StorePageLayout extends State<StorePage> {
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
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          child: TextFieldIcon(),
                        ),
                      ),
                      Container(
                        height: 300.0,
                        child: StoreItemPage(),
                      ),
                    ],
                  ),
                ),
              ),
              RightDrawerStorePage(),
            ],
          ),
        ),
      ),
    );
  }
}