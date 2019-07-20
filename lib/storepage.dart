import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/widget/right_drawer.dart';
import 'package:lulomart_mobile/widget/storeitempage.dart';
import 'package:lulomart_mobile/widget/textfieldicon.dart';

class StoreItem extends StatefulWidget {
  @override
  StoreItemList createState() => StoreItemList();
}

class StoreItemList extends State<StoreItem> {
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
              RightDrawer(),
            ],
          ),
        ),
      ),
    );
  }
}
