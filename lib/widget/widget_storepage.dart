import 'package:flutter/material.dart';

class RightDrawerStorePage extends StatefulWidget {
  @override
  _RightDrawerStorePageState createState() => _RightDrawerStorePageState();
}

class _RightDrawerStorePageState extends State<RightDrawerStorePage> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 190,
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
                            'Sayur',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp 5.000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'Sayur',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp 5.000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'Sayur',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Rp 5.000',
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
                  Text(
                    'Quantity : 10',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Total : Rp 10.000',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.white),
          Container(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: const Text('Cancel'),
                  color: Colors.red[300],
                  elevation: 4.0,
                  onPressed: () {},
                ),
                RaisedButton(
                  child: const Text('Hold'),
                  color: Colors.yellow[300],
                  elevation: 4.0,
                  onPressed: () {},
                ),
                RaisedButton(
                  child: const Text('Payment'),
                  color: Colors.green[300],
                  elevation: 4.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
