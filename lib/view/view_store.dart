import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lulomart_mobile/config/api.dart';
import 'package:lulomart_mobile/widget/widget_textfieldicon.dart';

var ket = "";

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
      var datauser = json.decode(response.body);
      // debugPrint(datauser[0]["product_picture"]);
      List<ItemCard> items = List();

      for (var i = 0; i < datauser.length; i++) {
        if (datauser[i]['productcategory_id'] == ket) {
          items.add(
            new ItemCard(
              onTap: (Item item) {
                // debugPrint("${item.productPrice}");
                onTap(item);
              },
              item: new Item(
                productPicture: datauser[i]['product_picture'],
                productName: datauser[i]['product_name'],
                productPrice: datauser[i]['product_price'],
              ),
            ),
          );
        } else {
          items.add(
            new ItemCard(
              onTap: (Item item) {
                // debugPrint("${item.productPrice}");
                onTap(item);
              },
              item: new Item(
                productPicture: datauser[i]['product_picture'],
                productName: datauser[i]['product_name'],
                productPrice: datauser[i]['product_price'],
              ),
            ),
          );
        }
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
                child: TextFieldIcon(
                    // onListItemTapCategory: (ItemCategory item) {
                    //   debugPrint("StorePage : " + item.productcategoryId);
                    //   onListItemTapCategory.addReceip(new ReceiptCategory(
                    //     name: item.productcategoryId,
                    //   ));
                    // },
                    ),
              ),
            ),
            Container(
                height: 500.0,
                child: GridView.count(
                  crossAxisCount: 3,
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
    String a = 'https://www.lulomart.com/inventory/upload/product/' +
        item.productPicture;
    return Card(
      child: InkWell(
        onTap: () {
          this.onTap(item);
        },
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(a),
                fit: BoxFit.cover,
              )),
            ),
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

  Item({
    this.productPicture,
    this.productName,
    this.productPrice,
  });
}

class Receipt {
  final String name;
  final String qty;
  final String price;

  Receipt({this.price, this.name, this.qty});
}

class RightDrawerStorePage extends StatefulWidget {
  // final String id;
  addReceip(Receipt receipt) {
    rightDrawerStorePageState.addReceip(receipt);
  }

  var rightDrawerStorePageState = _RightDrawerStorePageState();
  // RightDrawerStorePage({this.id});
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

  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
            height: 300,
            width: 200,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  width: 200,
                  child: RaisedButton(
                    child: const Text('Cancel'),
                    color: Colors.red[300],
                    elevation: 4.0,
                    onPressed: () {
                      //  clear();
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: RaisedButton(
                    child: const Text('Hold'),
                    color: Colors.yellow[300],
                    elevation: 4.0,
                    onPressed: () {
                      //  clear();
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: RaisedButton(
                    child: const Text('Payment'),
                    color: Colors.green[300],
                    elevation: 4.0,
                    onPressed: () {},
                  ),
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
            Row(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {},
                  child: Icon(Icons.keyboard_arrow_right, size: 1),
                ),
                Text(
                  "${receipt.qty}",
                  style: TextStyle(color: Colors.white),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Icon(Icons.keyboard_arrow_right, size: 1),
                ),
              ],
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

class TextFieldIcon extends StatefulWidget {
  final ValueChanged<ItemCategory> onListItemTapCategory;
  TextFieldIcon({this.onListItemTapCategory});
  @override
  _TextFieldIconState createState() =>
      _TextFieldIconState(onTap: (ItemCategory item) {
        // debugPrint("StorePageitem list : " + item.user);
        this.onListItemTapCategory(item);
      });
}

class _TextFieldIconState extends State<TextFieldIcon> {
  final ValueChanged<ItemCategory> onTap;
  _TextFieldIconState({this.onTap});
  List<ItemCardCategory> itemCard = List();

  getData() async {
    Api api = Api();

    return http.get(api.categoryItem).then((http.Response response) {
      var datauser = json.decode(response.body);
      // debugPrint(datauser[0]["product_picture"]);
      List<ItemCardCategory> items = List();

      for (var i = 0; i < datauser.length; i++) {
        items.add(
          new ItemCardCategory(
            onTap: (ItemCategory item) {
              // debugPrint("${item.productPrice}");
              onTap(item);
            },
            item: new ItemCategory(
              productcategoryname: datauser[i]['productcategory_name'],
              productcategoryId: datauser[i]['productcategory_id'],
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

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 11.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(style: BorderStyle.solid)),
                ),
              ),
            ),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: itemCard,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCardCategory extends StatefulWidget {
  final ValueChanged<ItemCategory> onTap;
  final ItemCategory item;

  const ItemCardCategory({Key key, this.onTap, this.item}) : super(key: key);

  @override
  _ItemCardCategoryState createState() => _ItemCardCategoryState();
}

class _ItemCardCategoryState extends State<ItemCardCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 10,
        padding: EdgeInsets.all(8),
        decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xffed5565), width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: RawMaterialButton(
          splashColor: Colors.red,
          onPressed: () {
            // this.widget.onTap(widget.item);
          
            setState(() {
              ket = widget.item.productcategoryId;
            });
          },
          child: Text(
            widget.item.productcategoryname,
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ItemCategory {
  final String productcategoryname;
  final String productcategoryId;

  ItemCategory({
    this.productcategoryname,
    this.productcategoryId,
  });
}

class ReceiptCategory {
  final String name;

  ReceiptCategory({this.name});
}
