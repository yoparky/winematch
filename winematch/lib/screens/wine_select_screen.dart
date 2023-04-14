// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:winematch/models/wine_type.dart';

import '../widgets/wine_selection_form.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WineSelectPage();
  }
}

class WineSelectPage extends StatefulWidget {
  const WineSelectPage({Key? key}) : super(key: key);

  @override
  _WineSelectPageState createState() => _WineSelectPageState();
}

class _WineSelectPageState extends State<WineSelectPage> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/wine_type.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["category"];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          // Display the data loaded from sample.json
          _items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        key: ValueKey(_items[index]["id"]),
                        margin: const EdgeInsets.all(10),
                        color: Colors.amber.shade100,
                        child: ListTile(
                            leading: Text(_items[index]["name"]),
                            title: Text(_items[index]["name"]),
                            subtitle: Text(_items[index]["name"]),
                            onTap: () {
                              var wineType = WineType(_items, index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WineSelectionForm(wineType)));
                            }),
                      );
                    },
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
