import 'package:flutter/material.dart';

class RightDrawerHistoryPage extends StatefulWidget {
  @override
  _RightDrawerHistoryPageState createState() => _RightDrawerHistoryPageState();
}

class _RightDrawerHistoryPageState extends State<RightDrawerHistoryPage> {
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: Column(children: <Widget>[
          Container(
            color: Colors.black38,
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'Product',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Qty',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Per-item',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Price',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'Beras',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp.80.000',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp.160.000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'Beras',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp.80.000',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp.160.000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'Beras',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp.80.000',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp.160.000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Text("Total Trx : Rp.680.000", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          Divider(color: Colors.white),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Print'),
                    color: Colors.white,
                    elevation: 4.0,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
