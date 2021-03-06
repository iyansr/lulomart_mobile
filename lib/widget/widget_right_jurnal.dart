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
    return ListView(
      children: <Widget>[
        Container(
          height: 300,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 295,
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
                        selectedDateTime: _currentDate,
                        daysHaveCircularBorder: null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: RaisedButton(
              child: const Text('Print'),
              color: Colors.white,
              elevation: 4.0,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
