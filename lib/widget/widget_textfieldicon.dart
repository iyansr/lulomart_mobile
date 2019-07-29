import 'package:flutter/material.dart';

class TextFieldIcon extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 10,
                    padding: const EdgeInsets.all(8),
                    decoration: new BoxDecoration(
                      border:
                          new Border.all(color: Color(0xffed5565), width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Makanan",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(),
                      elevation: 2.0,
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                  Container(
                    height: 10,
                    padding: const EdgeInsets.all(8),
                    decoration: new BoxDecoration(
                      border:
                          new Border.all(color: Color(0xffed5565), width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Minuman",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(),
                      elevation: 2.0,
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                  Container(
                    height: 10,
                    padding: const EdgeInsets.all(8),
                    decoration: new BoxDecoration(
                      border:
                          new Border.all(color: Color(0xffed5565), width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Alat Kebersihan",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(),
                      elevation: 2.0,
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(style: BorderStyle.solid)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
