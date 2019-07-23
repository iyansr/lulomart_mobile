import 'package:flutter/material.dart';

class RightDrawerHistoryPage extends StatefulWidget {
  @override
  _RightDrawerHistoryPageState createState() => _RightDrawerHistoryPageState();
}

class _RightDrawerHistoryPageState extends State<RightDrawerHistoryPage> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
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
    );
  }
}
