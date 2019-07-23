import 'package:flutter/material.dart';
import 'package:lulomart_mobile/widget/storeitempage.dart';
import 'package:lulomart_mobile/widget/textfieldicon.dart';

class MainStorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
