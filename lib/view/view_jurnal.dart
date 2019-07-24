import 'package:flutter/material.dart';

class JurnalPage extends StatefulWidget {
  @override
  _JurnalPageState createState() => _JurnalPageState();
}

class _JurnalPageState extends State<JurnalPage> {
  var day = DateTime.now().day;
  var month = DateTime.now().month;
  var year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Text('Jurnal : $day - $month - $year'),
          SizedBox(height: 20),
          Container(
            color: Colors.green,
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Keterangan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'x',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'y',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Text('Pendapatan Kasir'),
                    Text('Rp 200.000'),
                    Text('Rp 200.000'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.reorder,
                  size: 20,
                ),
                SizedBox(width: 12),
                Text('trx12030130128'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Text('Pendapatan Kasir'),
                    Text('Rp 200.000'),
                    Text('Rp 200.000'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Text('Pendapatan Kasir'),
                    Text('Rp 200.000'),
                    Text('Rp 200.000'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Text('Pendapatan Kasir'),
                    Text('Rp 200.000'),
                    Text('Rp 200.000'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
