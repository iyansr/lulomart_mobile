import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lulomart_mobile/config/api.dart';

class HistoryList extends StatefulWidget {
  final ValueChanged<ItemHistory> onListItemTapHistory;
  HistoryList({this.onListItemTapHistory});

  @override
  _HistoryListState createState() =>
      _HistoryListState(onTap: (ItemHistory item) {
        // debugPrint("StorePageitem list : " + item.user);
        this.onListItemTapHistory(item);
      });
}

class _HistoryListState extends State<HistoryList> {
  final ValueChanged<ItemHistory> onTap;
  _HistoryListState({this.onTap});

  List<ItemCard> itemCard = List();

  getData() async {
    Api api = Api();

    return http.get(api.history).then((http.Response response) {
      var datauser = json.decode(response.body);
      // debugPrint(datauser[0]["product_picture"]);
      List<ItemCard> items = List();

      for (var i = 0; i < datauser.length; i++) {
        items.add(
          new ItemCard(
            onTap: (ItemHistory item) {
              // debugPrint("${item.productPrice}");
              onTap(item);
            },
            item: new ItemHistory(
              transaksiId: datauser[i]['transaction_id'],
              transaksiDate: datauser[i]['transaction_date'],
              transaksiTotalprice: datauser[i]['transaction_totalprice'],
            ),
          ),
        );
      }

      setState(() {
        itemCard = items;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 500.0,
                  child: ListView(
                    children: itemCard,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final ValueChanged<ItemHistory> onTap;
  final ItemHistory item;

  const ItemCard({Key key, this.onTap, this.item}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  void initState() {
    super.initState();
  }

  Set<HisoryDetails> histry = Set<HisoryDetails>();

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 500,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          (widget.item.transaksiId),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(widget.item.transaksiTotalprice),
                        Text(widget.item.transaksiDate),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(widget.item.transaksiTotalprice),
                        RaisedButton(
                          child: const Text(
                            'Details',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                          elevation: 4.0,
                          onPressed: () {
                            setState(() {
                              //
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class ItemHistory {
  final String transaksiId;
  final String transaksiDate;
  final String transaksiTotalprice;

  ItemHistory({
    this.transaksiId,
    this.transaksiDate,
    this.transaksiTotalprice,
  });
}

class ReceiptHistory {
  final String name;
  final String qty;
  final String price;

  ReceiptHistory({this.price, this.name, this.qty});
}

class RightDrawerHistoryPage extends StatefulWidget {
  var rightDrawerStoreHistoryPage = _RightDrawerHistoryPageState();

  @override
  _RightDrawerHistoryPageState createState() => rightDrawerStoreHistoryPage;
}

class _RightDrawerHistoryPageState extends State<RightDrawerHistoryPage> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('as'), //item,
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
    );
  }
}

class HisoryDetails extends StatelessWidget {
  String trxId;
  String trxDate;
  String trxTotal;
  String trxPayment;
  String trxStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Text(this.trxDate),
          Text(this.trxStatus),
          Text(this.trxPayment),
        ],
      ),
    );
  }
}
