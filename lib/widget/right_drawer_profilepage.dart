import 'package:flutter/material.dart';
import 'package:lulomart_mobile/profilepage.dart';

class RightDrawerProfilePage extends StatefulWidget {
  @override
  _RightDrawerProfilePageState createState() => _RightDrawerProfilePageState();
}

class _RightDrawerProfilePageState extends State<RightDrawerProfilePage> {
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 10,
        child: Container(
          color: Colors.black87,
        ),
      ),
    );
  }
}
