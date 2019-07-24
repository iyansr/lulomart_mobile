import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RightDrawerAboutPage extends StatefulWidget {
  @override
  _RightDrawerAboutPageState createState() => _RightDrawerAboutPageState();
}

class _RightDrawerAboutPageState extends State<RightDrawerAboutPage> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.facebookF, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("technos.studio", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.instagram, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("technosstudio.product", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.youtube, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("Technos Studio", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
