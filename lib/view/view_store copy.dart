import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lulomart_mobile/config/api.dart';
import 'package:lulomart_mobile/widget/widget_textfieldicon.dart';

class StorePage extends StatefulWidget {
  final ValueChanged<String> onListItemTap;
  StorePage({this.onListItemTap});
  @override
  StorePageLayout createState() => StorePageLayout(onTap: (String str) {
        debugPrint("StorePageitem list : " + str);
        this.onListItemTap(str);
      });
}

class StorePageLayout extends State<StorePage> {
  final ValueChanged<String> onTap;
  StorePageLayout({this.onTap});

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
              height: 300.0,
              child: StoreItemPage(onListItemTap: (String str) {
              debugPrint( "StorePageLayoutitem list : "+  str );
              this.onTap(str);
            }),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreItemPage extends StatefulWidget {
  final List list;
  final ValueChanged<String> onListItemTap; 
  StoreItemPage({this.list, this.onListItemTap});
  @override
  _StoreItemPageState createState() => _StoreItemPageState(
      onTap :( String str ){
        debugPrint( "StoreItemPage item list : "+  str );
        onListItemTap( str );
      }

  );
}

class _StoreItemPageState extends State<StoreItemPage> {
  final ValueChanged<String> onTap; 
  _StoreItemPageState({ this.onTap });
  Future<List> getData() async {
    Api api = Api();

    return http.get(api.item).then((http.Response response) {
      var datauser = json.decode(response.body);
      var d = datauser['hits'];
      return d;
    });
  }

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
                  onTap:(String str){
                    debugPrint( "_StoreItemPageStateitem list : "+  str );
                      this.onTap( str );
                  }
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final ValueChanged<String> onTap;
  final List list;
  ItemList({this.list, this.onTap});
  @override
  _ItemListState createState() => _ItemListState(
      list: this.list,
      onTap: (String str) {
        debugPrint("ItemListitem list : " + str);
        this.onTap(str);
      });
}

class _ItemListState extends State<ItemList> {
  final ValueChanged<String> onTap;
  final List list;
  _ItemListState({this.onTap, this.list});

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: widget.list == null ? 0 : widget.list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(3.0),
          child: Card(
              child: InkWell(
            onTap: () {
              debugPrint(" _ItemListStateitem list : " +
                  widget.list[i]['user'] +
                  " " +
                  "${widget.list[i]['favorites']}");
              this.onTap(widget.list[i]['user'] +
                  " " +
                  "${widget.list[i]['favorites']}");
            },
            child: Column(
              children: [
                Image.network(widget.list[i]['webformatURL']),
                Text(widget.list[i]['user']),
                Text("${widget.list[i]['favorites']}"),
              ],
            ),
          )),
        );
      },
    );
  }
}

class RightDrawerStorePage extends StatefulWidget {
  final String id;
  RightDrawerStorePage({this.id});
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
