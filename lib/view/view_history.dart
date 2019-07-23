import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/widget/widget_historylist.dart';
import 'package:lulomart_mobile/widget/widget_historypage.dart';

class HistoryPage extends StatefulWidget {
  @override
  HistoryPageLayout createState() => HistoryPageLayout();
}

class HistoryPageLayout extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

   return HistoryList();
  }
}
