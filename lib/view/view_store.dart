import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/widget_storeitempage.dart';
import 'package:lulomart_mobile/widget/widget_textfieldicon.dart';

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

    return SingleChildScrollView(
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
    );
  }
}
