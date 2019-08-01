import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lulomart_mobile/config/api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List dataJson;
  Api apiUrl = Api();

  Future<String> getData() async {
    http.Response hasil = await http.get(Uri.encodeFull(apiUrl.history),
        headers: {'Accept': 'application/json'});

    setState(() {
      dataJson = jsonDecode(hasil.body);
    });
    return ' ';
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  String pamenMethod, dateDetail, price, trxId;
  @override
  Widget build(BuildContext context) {
    Future<String> cardData = getData();

    return Scaffold(
      body: FutureBuilder<String>(
        future: cardData,
        builder: (c, s) {
          return Row(
            children: <Widget>[
              Expanded(
                flex: 15,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: dataJson == null ? 0 : dataJson.length,
                    itemBuilder: (c, i) {
                      return Card(
                        child: ListTile(
                          title: Text(dataJson[i]['transaction_id']),
                          subtitle: Text(dataJson[i]['transaction_date']),
                          trailing: RaisedButton(
                            color: Colors.red,
                            child: Text('Details'),
                            onPressed: () {
                              // model.setDetailDate(i);
                              setState(() {
                                pamenMethod =
                                    dataJson[i]['transaction_paymethod'];
                                trxId = dataJson[i]['transaction_id'];
                                dateDetail = dataJson[i]['transaction_date'];
                              });
                              print('$i');
                              print('$dateDetail');
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  color: Colors.black87,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.black38,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                trxId == null ? ' ' : '$trxId',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                dateDetail == null ? ' ' : '$dateDetail',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                pamenMethod == null ? ' ' : '$pamenMethod',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ), //item,
                        ),
                      ),
                      Divider(color: Colors.white),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: RaisedButton(
                            child: const Text('Print'),
                            color: Colors.white,
                            elevation: 4.0,
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class RightHistory extends StatefulWidget {
  @override
  _RightHistoryState createState() => _RightHistoryState();
}

class _RightHistoryState extends State<RightHistory> {
  @override
  Widget build(BuildContext context) => Container();
}
