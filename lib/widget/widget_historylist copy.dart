import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lulomart_mobile/config/api.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  Future<List> getData() async {

    Api api = Api();
    
    final response = await http.get( api.history );
    return json.decode(response.body);
  }

  final bool isBorderEnabled = false;

  final actionIcon = Icons.border_all;

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
          ),
        );
      },
    );
  }
}
