import 'package:flutter/material.dart';
import 'package:lulomart_mobile/historypage.dart';

class HistoryList extends StatefulWidget {
  @override
  HistoryListLayout createState() => HistoryListLayout();
}

class HistoryListLayout extends State<HistoryList> {
  bool isBorderEnabled = false;
  var actionIcon = Icons.border_all;

  Widget makeList() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return makeCard();
        },
      ),
    );
  }

  Widget makeCard() {
    return Card(
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: tableFormat,
        ),
      ),
    );
  }

  final tableFormat = Table(
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: <TableRow>[
      TableRow(children: <Widget>[
        Container(
          width: 500,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('trx20181222110936147917', style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text('Hartono Jumanji'),
                  Text('2018-12-22 11:04:39'),
                ],
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Rp.80.000'),
                  RaisedButton(
                    child: const Text(
                      'Details',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    elevation: 4.0,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ])
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: makeList(),
    );
  }
}
