import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/historypage.dart';

class RightDrawerHistoryPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 8,
        child: Container(
          color: Colors.black87,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
                    
                  ),
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        child: const Text('Print'),
                        color: Colors.white,
                        elevation: 4.0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
