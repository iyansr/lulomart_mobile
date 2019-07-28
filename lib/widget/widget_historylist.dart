import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  Future<List> getData() async {
    final response = await http.get(
        "http://todolist.madukubah.com/api/activity/complete_activities/2");
    return json.decode(response.body);
  }

  final bool isBorderEnabled = false;

  final actionIcon = Icons.border_all;

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
                  Text(
                    'trx20181222110936147917',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
    return new Scaffold(
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
//  @override
//   Widget build(BuildContext context) {
//     return makeList();
//   }}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(children: <Widget>[
                  Container(
                    width: 500,
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              (list[i]['user_id']),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(list[i]['title']),
                            Text(list[i]['date']),
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
                            Text("${list[i]['time']}"),
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
            ),
            // Text(list[i],['user_id']),
            // title: new Text(list[i]['title']),
            // leading: new Icon(Icons.widgets),
            // subtitle: new Text(list[i]['description']),
          ),
        );
      },
    );
  }
}
