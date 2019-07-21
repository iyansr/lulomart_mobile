import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/storepage.dart';
import 'package:lulomart_mobile/widget/right_drawer_historypage.dart';

class HistoryPage extends StatefulWidget {
  @override
  HistoryPageLayout createState() => HistoryPageLayout();
}

class HistoryPageLayout extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Row(
            children: <Widget>[
              LeftDrawer(),
              Expanded(
                flex: 10,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(child: null),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 300.0,
                              child: Table(
                                  border: TableBorder.all(
                                    width: 1.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                      TableCell(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text("Trx ID"),
                                                  ],
                                                ),
                                                SizedBox(width: 150,),
                                                Column(
                                                  children: <Widget>[
                                                    Text("Details"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text("1st Column"),
                                                    Text("1st Column"),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text("2nd Column"),
                                                    RaisedButton(
                                                      child:
                                                          const Text('Details'),
                                                      color: Colors.red[300],
                                                      elevation: 4.0,
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ])),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              RightDrawerHistoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}
