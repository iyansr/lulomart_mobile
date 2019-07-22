import 'package:flutter/material.dart';
import 'package:lulomart_mobile/storepage.dart';

class LeftDrawer extends StatefulWidget {
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 2,
        child: Container(
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xfff84c35), Color(0xfff96f5d)],
                  stops: [0, 1])),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.person,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(height: 15.0),
                RawMaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.shopping_cart,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Color(0xfff96f5d),
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(height: 5.0),
                RawMaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.local_offer,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Color(0xfff96f5d),
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(height: 5.0),
                RawMaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.bookmark,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Color(0xfff96f5d),
                  padding: const EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
