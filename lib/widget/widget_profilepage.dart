import 'package:flutter/material.dart';

class RightDrawerProfilePage extends StatefulWidget {
  @override
  _RightDrawerProfilePageState createState() => _RightDrawerProfilePageState();
}

class _RightDrawerProfilePageState extends State<RightDrawerProfilePage> {
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 9,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.black87),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5.0)),
                  SizedBox(height: 1.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(style: BorderStyle.solid)),
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Some Text";
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
