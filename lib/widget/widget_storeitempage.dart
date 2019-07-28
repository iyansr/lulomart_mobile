import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lulomart_mobile/widget/widget_detail.dart';

class StoreItemPage extends StatefulWidget {
  final List list;
  StoreItemPage({this.list});
  @override
  _StoreItemPageState createState() => _StoreItemPageState();
}

class _StoreItemPageState extends State<StoreItemPage> {
  Future<List> getData() async {
    String url =
        "https://pixabay.com/api/?key=13121969-5ba836de16bbc5a6335db25bc&q=yellow+flowers&image_type=photo&pretty=true";
    return http.get(url).then((http.Response response) {
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
    return new GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(3.0),
          child: Card(
              child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Image.network(list[i]['webformatURL']),
                Text(list[i]['user']),
                Text("${list[i]['favorites']}"),
              ],
            ),
          )),
        );
      },
    );
  }
}
