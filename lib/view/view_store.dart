import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lulomart_mobile/config/api.dart';
import 'package:lulomart_mobile/widget/widget_textfieldicon.dart';

class StorePage extends StatefulWidget {
  final ValueChanged<Item> onListItemTap;
  StorePage({this.onListItemTap});
  @override
  StorePageLayout createState() => StorePageLayout(onTap: (Item item) {
        // debugPrint("StorePageitem list : " + item.user);
        this.onListItemTap(item);
      });
}

class StorePageLayout extends State<StorePage> {
  final ValueChanged<Item> onTap;
  StorePageLayout({this.onTap});
  List<ItemCard> itemCard = List();

  getData() async {
    Api api = Api();

    return http.get(api.item).then((http.Response response) {
      // debugPrint("$response");
      var datauser = json.decode(response.body);
      // List datauser = datauser;
      debugPrint(datauser[0]["product_picture"]);
      List<ItemCard> items = List();

      for (var i = 0; i < datauser.length; i++) {
        items.add(
          new ItemCard(
            onTap: (Item item) {
              debugPrint("${item.productPrice}");
              onTap(item);
            },
            item: new Item(
              productPicture  : datauser[i]['product_picture'],
              productName     : datauser[i]['product_name'],
              productPrice    : datauser[i]['product_price'],
              
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
              padding: const EdgeInsets.all(1.0),
              child: Container(
                child: TextFieldIcon(),
              ),
            ),
            Container(
                height: 400.0,
                child: GridView.count(
                  crossAxisCount: 1,
                  children: itemCard,
                )),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ValueChanged<Item> onTap;
  final Item item;

  const ItemCard({Key key, this.onTap, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Center(
    //   child: new CircularProgressIndicator(),
    // );
    return Card(
      child: InkWell(
        onTap: () {
          this.onTap(item);
        },
        child: Column(
          children: [
            Image.network(item.productPicture),
            Text(item.productName),
            Text("${item.productPrice}"),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String productPicture;
  final String productName;
  final String productPrice;

  Item({this.productPicture, this.productName, this.productPrice,});
}

class Receipt {
  final String name;
  final String qty;
  final String price;

  Receipt({this.price, this.name, this.qty});
}

class RightDrawerStorePage extends StatefulWidget {
  final String id;
  addReceip(Receipt receipt) {
    rightDrawerStorePageState.addReceip(receipt);
  }

  var rightDrawerStorePageState = _RightDrawerStorePageState();
  RightDrawerStorePage({this.id});
  @override
  _RightDrawerStorePageState createState() => rightDrawerStorePageState;
}

class _RightDrawerStorePageState extends State<RightDrawerStorePage> {
  List<Receiptcard> receiptTable = List();

  void addReceip(Receipt _receipt) {
    setState(() {
      // debugPrint("Receipt : " + receipt.name);
      this.receiptTable.add(new Receiptcard(receipt: _receipt));
    });
  }
  // void clear(){
  //   setState(() {
  //    Text("data");

  //   });
  // }
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
                  Column(
                    children: receiptTable,
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
                  onPressed: () {
                    //  clear();
                  },
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

class Receiptcard extends StatelessWidget {
  final Receipt receipt;
  final Item item;

  const Receiptcard({Key key, this.receipt, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Text(
              receipt.name,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "${receipt.qty}",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "${receipt.price}",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
