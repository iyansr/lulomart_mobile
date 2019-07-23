import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List<String> listJualan = new List();

  // Detail({this.nama, this.gambar});
  // final String nama;
  // final String gambar;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // _buatlist() async {
  //   for (var i = 0; i < jualan.length; i++) {
  //     final jualannya = jualan[i];
  //     final String gambar = jualannya["gambar"];

  //     listJualan.add(new Container());
  //   }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240.0,
        child: new Hero(
          tag: "",
          child: new Material(
            child: ListView.builder(
              itemCount: widget.listJualan.length,
              itemBuilder: (c, i) {
                print(widget.listJualan);
                return Container(
                  child:Text(widget.listJualan[i].toString()),
                );
                // Text(widget.listJualan[i].toString());
              },
            ),
          ),
        ));

    //   return ListView(
    //       children: <Widget>[
    //         new Container(
    //             height: 240.0,
    //             child: new Hero(
    //               tag:"",
    //               child: new Material(
    //                 child: new InkWell(
    //                 ),
    //               ),
    //             )),
    //         // new BagianNama(
    //         //   nama: widget.nama,
    //         // ),
    //       ],
    //   );
    // }
  }

// class BagianNama extends StatelessWidget {
//   BagianNama({this.nama});
//   final String nama;

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       padding: new EdgeInsets.all(10.0),
//       child: new Row(
//         children: <Widget>[
//           new Expanded(
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Center(
//                   child: new Text(
//                     nama,
//                     style: new TextStyle(fontSize: 30.0, color: Colors.blue,),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
