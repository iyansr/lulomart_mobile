import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'package:lulomart_mobile/widget/right_drawer.dart';

class TextFieldIcon extends StatelessWidget {


  Widget build(BuildContext context) {
      return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(style: BorderStyle.solid)
              ),
          ),
        ),
      )
    );
  }
}
