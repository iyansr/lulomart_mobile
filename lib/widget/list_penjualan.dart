import 'package:flutter/material.dart';

class ListPenjualan extends StatefulWidget {
  @override
  _ListPenjualanState createState() => _ListPenjualanState();
}

class _ListPenjualanState extends State<ListPenjualan> {
  List<Container> daftarJualan = new List();

  var jualan = [
    {"produk": "kerupuk", "qty": "1", "harga": "Rp. 1000"},
    {"produk": "pisang",  "qty": "2", "harga": "Rp. 5000"},
    {"produk": "apel",    "qty": "5", "harga": "Rp. 9000"},
    {"produk": "manga",   "qty": "1", "harga": "Rp. 2000"},
    {"produk": "aku",     "qty": "3", "harga": "Rp. 8000"},
    {"produk": "kamu",    "qty": "4", "harga": "Rp. 2000"},
    {"produk": "kerupuk", "qty": "1", "harga": "Rp. 1000"},
    {"produk": "pisang",  "qty": "2", "harga": "Rp. 5000"},
    {"produk": "apel",    "qty": "5", "harga": "Rp. 9000"},
    {"produk": "manga",   "qty": "1", "harga": "Rp. 2000"},
    {"produk": "aku",     "qty": "3", "harga": "Rp. 8000"},
    {"produk": "kamu",    "qty": "4", "harga": "Rp. 2000"},
    {"produk": "kerupuk", "qty": "1", "harga": "Rp. 1000"},
    {"produk": "pisang",  "qty": "2", "harga": "Rp. 5000"},
    {"produk": "apel",    "qty": "5", "harga": "Rp. 9000"},
    {"produk": "manga",   "qty": "1", "harga": "Rp. 2000"},
    {"produk": "aku",     "qty": "3", "harga": "Rp. 8000"},
    {"produk": "kamu",    "qty": "4", "harga": "Rp. 2000"},
   

  ];

  _buatlist() async {
    for (var i = 0; i < jualan.length; i++) {
      final jualannya = jualan[i];

      daftarJualan.add(new Container(
          padding: new EdgeInsets.only(top: 2.0),
          // child: new Card(
          child: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:5.0),
                    child: Text(
                      jualannya['produk'],
                      style: new TextStyle(fontSize: 8.0, color: Colors.white),
                    ),
                  ),
                  
                   Padding(
                     padding: const EdgeInsets.only(left:10.0),
                     child: Text(
                      jualannya['qty'],
                      style: new TextStyle(fontSize: 8.0, color: Colors.white),
                  ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left:10.0),
                     child: Text(
                      jualannya['harga'],
                      style: new TextStyle(fontSize: 8.0, color: Colors.white),
                  ),
                   ),
                ],
              )
            ],
          )));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: daftarJualan);
  }
}
