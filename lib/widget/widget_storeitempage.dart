import 'package:flutter/material.dart';
import 'package:lulomart_mobile/widget/widget_detail.dart';

class StoreItemPage extends StatefulWidget {
  @override
  _StoreItemPageState createState() => _StoreItemPageState();
}

class _StoreItemPageState extends State<StoreItemPage> {
  List j = Detail().listJualan;
  List<Container> daftarJualan = new List();

  var jualan = [
    {"nama": "Pasar Baruga", "gambar": "28.jpg"},
    {"nama": "Pasar Kelapa", "gambar": "29.jpg"},
    {"nama": "Pasar Bambang", "gambar": "30.jpg"},
    {"nama": "Pasar Asep", "gambar": "31.jpg"},
    {"nama": "Sayur Kol", "gambar": "A3.jpg"},
    {"nama": "Sayur Tumis", "gambar": "A2.jpeg"},
    {"nama": "Pasar Bu iKa", "gambar": "27.jpg"},
    {"nama": "Pasar Tajidun", "gambar": "30.jpg"},
    {"nama": "Pasar Baruga", "gambar": "28.jpg"},
    {"nama": "Pasar Kelapa", "gambar": "29.jpg"},
    {"nama": "Pasar Bambang", "gambar": "30.jpg"},
    {"nama": "Pasar Asep", "gambar": "31.jpg"},
    {"nama": "Sayur Kol", "gambar": "A3.jpg"},
    {"nama": "Sayur Tumis", "gambar": "A2.jpeg"},
    {"nama": "Pasar Bu iKa", "gambar": "27.jpg"},
    {"nama": "Pasar Tajidun", "gambar": "30.jpg"},
    {"nama": "Pasar Baruga", "gambar": "28.jpg"},
    {"nama": "Pasar Kelapa", "gambar": "29.jpg"},
    {"nama": "Pasar Bambang", "gambar": "30.jpg"},
    {"nama": "Pasar Asep", "gambar": "31.jpg"},
    {"nama": "Sayur Kol", "gambar": "A3.jpg"},
    {"nama": "Sayur Tumis", "gambar": "A2.jpeg"},
    {"nama": "Pasar Bu iKa", "gambar": "27.jpg"},
    {"nama": "Pasar Tajidun", "gambar": "30.jpg"},
    {"nama": "Pasar Baruga", "gambar": "28.jpg"},
    {"nama": "Pasar Kelapa", "gambar": "29.jpg"},
    {"nama": "Pasar Bambang", "gambar": "30.jpg"},
    {"nama": "Pasar Asep", "gambar": "31.jpg"},
    {"nama": "Sayur Kol", "gambar": "A3.jpg"},
    {"nama": "Sayur Tumis", "gambar": "A2.jpeg"},
    {"nama": "Pasar Bu iKa", "gambar": "27.jpg"},
    {"nama": "Pasar Tajidun", "gambar": "30.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < jualan.length; i++) {
      final jualannya = jualan[i];
      final String gambar = jualannya["gambar"];

      daftarJualan.add(new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              Hero(
                tag: jualannya['nama'],
                child: new Material(
                  child: new InkWell(
                    onTap: () {
                      setState(() {
                        j.add(jualannya['nama']);
                      });
                    },
                    child: new Image.asset(
                      "assets/images/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(3.0),
              ),
              new Text(
                jualannya['nama'],
                style: new TextStyle(fontSize: 10.0),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: daftarJualan,
    );
  }
}

