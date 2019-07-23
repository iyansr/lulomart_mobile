import 'package:flutter/material.dart';
import 'package:lulomart_mobile/widget/detail.dart';

class RightDrawerStorePage extends StatefulWidget {
  @override
  _RightDrawerStorePageState createState() => _RightDrawerStorePageState();
}

class _RightDrawerStorePageState extends State<RightDrawerStorePage> {
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 4,
        child: Container(
          color: Colors.black87,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Product",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Qty",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Per-Item",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 150.0,
                          child: Detail(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Cancel'),
                    color: Colors.red[300],
                    elevation: 4.0,
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Hold'),
                    color: Colors.yellow[300],
                    elevation: 4.0,
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Payment'),
                    color: Colors.green[300],
                    elevation: 4.0,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
