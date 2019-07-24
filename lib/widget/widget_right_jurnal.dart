import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'cale';

class RightDrawerJurnal extends StatefulWidget {
  @override
  _RightDrawerJurnalState createState() => _RightDrawerJurnalState();
}

var _currentDate = DateTime.now();

class _RightDrawerJurnalState extends State<RightDrawerJurnal> {
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CalendarCarousel(
          dayButtonColor: Colors.white,
          iconColor: Colors.white,
          todayBorderColor: Colors.white,
          selectedDayBorderColor: Colors.white,
          onDayPressed: (DateTime date, List<dynamic> l) {
            setState(() {
              _currentDate = date;
            });
          },
          thisMonthDayBorderColor: Colors.white,
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: null,
        ),
      ),
    );
  }
}
