import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_mobile/config/api.dart';
import 'package:lulomart_mobile/config/note.dart';

class TextFieldIcon extends StatefulWidget {
  @override
  _TextFieldIconState createState() => _TextFieldIconState();
}

class _TextFieldIconState extends State<TextFieldIcon> {
  List<ItemCard> itemCard = List();

  List<Note> _notes = List<Note>();
  List<Note> _notesForDisplay = List<Note>();

  Future<List<Note>> fetchNotes() async {
    var url = "http://www.lulomart.com/inventory/index.php/api/product";
    var response = await http.get(url);
    
    var notes = List<Note>();
    
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  getData() async {
    Api api = Api();

    return http.get(api.categoryItem).then((http.Response response) {
      var datauser = json.decode(response.body);
      // debugPrint(datauser[0]["product_picture"]);
      List<ItemCard> items = List();

      for (var i = 0; i < datauser.length; i++) {
        items.add(
          new ItemCard(
            // onTap: (Item item) {
            //   // debugPrint("${item.productPrice}");
            //   onTap(item);
            // },
            item: new Item(
              productcategoryname: datauser[i]['productcategory_name'],
            ),
          ),
        );
      }

      setState(() {
        itemCard = items;
      });
    });
  }

  @override
  void initState() {
    getData();
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 11.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(style: BorderStyle.solid)),
                ),
              ),
            ),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: itemCard,
              ),
            ),
          ],
        ),
      ),
    );
  }
  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.title.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ValueChanged<Item> onTap;
  final Item item;

  const ItemCard({Key key, this.onTap, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Container(
        height: 10,
        padding: EdgeInsets.all(8),
        decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xffed5565), width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: RawMaterialButton(
          splashColor: Colors.red,
          onPressed: () {},
          child: Text(
            item.productcategoryname,
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Item {
  final String productcategoryname;

  Item({
    this.productcategoryname,
  });
}
