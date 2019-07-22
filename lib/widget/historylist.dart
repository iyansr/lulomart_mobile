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
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile,
      ),
    );
  }

  final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    leading: Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(
        Icons.local_offer,
        color: Colors.black,
        size: 20,
      ),
    ),
    title: Text(
      "trx20181222110439524052",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Text(
          "Hartono Jumanji",
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        
        Divider(
          color: Colors.black,
        ),
      ],
    ),
    trailing: Column(
      children: <Widget>[
        Text("Rp.80.000", style: TextStyle(color: Colors.black, fontSize: 10)),
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
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: makeList(),
    );
  }
}
