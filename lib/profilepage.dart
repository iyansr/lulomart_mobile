import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/left_drawer.dart';
import 'widget/right_drawer_profilepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageLayout createState() => ProfilePageLayout();
}

class ProfilePageLayout extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Row(
            children: <Widget>[
              // LeftDrawer(),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
              RightDrawerProfilePage(),
            ],
          ),
        ),
      ),
    );
  }
}
